//
//  StatisticsHabitView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct StatisticsHabitView: View {
    @ObservedObject var habit: Habit

    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                ForEach(lastWeekCalendar(), id: \.self) { day in
                    let height = lastWeekStatistics()[day]!
                    BarChart(height: CGFloat(height))
                }
            }
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.gray)
            HStack {
                ForEach(lastWeekCalendar(), id: \.self) { day in
                    DayLabelView(day: day)
                }
            }
        }
    }
    
    private func lastWeekCalendar() -> [String]
    {
        var lastWeekCalendar = [String]()
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        for index in 0..<7 {
            let newDay = calendar.date(byAdding: .day, value: -index, to: Date())!
            lastWeekCalendar.append(formatter.string(from: newDay))
        }
        return lastWeekCalendar.reversed()
    }
    
    private func lastWeekSlots() -> [SpentTime]
    {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        var slots = [SpentTime]()
        
        for slot in habit.timeSlots {
            if slot.date > weekAgo {
                slots.append(slot)
            }
        }
        return slots
    }
    
    private func lastWeekStatistics() -> [String: Int]
    {
        var statistics = [String: Int]()
        let slots = lastWeekSlots()
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        
        for day in lastWeekCalendar() {
            statistics[day] = 0
            for slot in slots {
                if formatter.string(from: slot.date) == day {
                    statistics[day]! += slot.minutes
                }
            }
        }
        return statistics
    }
}

private struct DayLabelView: View {
    let day: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(day)
            Spacer()
        }
    }
}

private struct BarChart: View {
    var height: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            Rectangle()
                .frame(width: 30, height: max(height, 10))
                .foregroundColor(.blue)
                .cornerRadius(5)
            Spacer()
        }
    }
}

struct StatisticsHabitView_Previews: PreviewProvider {
    static let habit = HabitLibrary().testHabits[0]
    
    static var previews: some View {
        StatisticsHabitView(habit: habit)
    }
}
