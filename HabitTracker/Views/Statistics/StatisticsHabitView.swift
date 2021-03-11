//
//  StatisticsHabitView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct StatisticsHabitView: View {
    @ObservedObject var habitEntity: HabitEntity

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
    
    private func lastWeekSlots() -> [SpendTimeEntity]
    {
        let calendar = Calendar.current
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        var slots = [SpendTimeEntity]()
        
        guard let timeSlots = habitEntity.timeSlots else { return [] }
        for slot in Array(timeSlots) as! [SpendTimeEntity] {
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
                    statistics[day]! += Int(slot.minutes)
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
    static private let persistentController = PersistenceController.preview
    static private let habitEntity: HabitEntity = {
        let habitEntity = HabitEntity(context: persistentController.container.viewContext)
        habitEntity.id = UUID()
        habitEntity.name = "Habit test"
        habitEntity.stringDescription = "Description test"
        habitEntity.isFavorite = false
        habitEntity.imageUrl = URL(string: "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
        return habitEntity
    }()
    
    static var previews: some View {
        StatisticsHabitView(habitEntity: habitEntity)
    }
}
