//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 03/03/2021.
//

import SwiftUI
import Kingfisher

struct HabitDetailView: View {
    @ObservedObject var habit: Habit
    @State private var selectedDate = Date()
    @State private var selectedTime = 30
    @State private var isAddingTime = false
    @EnvironmentObject var habitLibrary: HabitLibrary
    
    var body: some View {
        ScrollView {
            VStack {
                HabitHeaderView(habit: habit)
                HabitDescriptionView(description: habit.description, minutes: habit.totalTime)
                    .padding()
                if isAddingTime {
                    TimeConfigurationView(selectedMinutes: $selectedTime, selectedDate: $selectedDate)
                        .padding()
                }
                StandardButtonView(color: isAddingTime ? .green : .blue, action: {
                    withAnimation {
                        isAddingTime ? addNewTime() : toggleEditionMode()
                    }
                }, title: isAddingTime ? "Validate" : "Add time")
                    .padding()
                ForEach(habit.timeSlots) { time in
                    TimeCellView(spentTime: time)
                        .padding()
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.5)
                }
            }
        }
    }
    
    private func addNewTime()
    {
        habitLibrary.objectWillChange.send()
        let newTime = SpentTime(date: selectedDate, minutes: selectedTime)
        habit.timeSlots.append(newTime)
        toggleEditionMode()
    }
    
    private func toggleEditionMode()
    {
        isAddingTime.toggle()
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var habit = HabitLibrary().testHabits[1]
    
    static var previews: some View {
        HabitDetailView(habit: habit)
    }
}
