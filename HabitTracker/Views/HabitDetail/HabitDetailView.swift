//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 03/03/2021.
//

import SwiftUI
import Kingfisher

struct HabitDetailView: View {
    @ObservedObject var habitEntity: HabitEntity
    @State private var selectedDate = Date()
    @State private var selectedTime = 30
    @State private var isAddingTime = false
    @EnvironmentObject var habitLibrary: HabitLibrary
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                HabitHeaderView(habitEntity: habitEntity)
                HabitDescriptionView(description: habitEntity.stringDescription, minutes: habitEntity.totalMinutesSpend())
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
                ForEach(habitEntity.spendTimes()) { time in
                    TimeCellView(spentTime: time)
                        .padding()
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.5)
                }
            }
        }.navigationBarItems(trailing: Button(action: {
            viewContext.delete(habitEntity)
            do {
                try viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
            }
        }, label: {
            Image(systemName: "trash")
                .foregroundColor(.black)
                .padding()
        }))
    }
    
    private func addNewTime()
    {
        habitLibrary.objectWillChange.send()
        let newTimeSlots = SpendTimeEntity(context: viewContext)
        newTimeSlots.id = UUID()
        newTimeSlots.date = selectedDate
        newTimeSlots.minutes = Int64(selectedTime)
        habitEntity.addToTimeSlots(newTimeSlots)
        do {
            try viewContext.save()
        } catch {
            print("Error: cannot save new timeSlotsEntity in context.")
        }
        toggleEditionMode()
    }
    
    private func toggleEditionMode()
    {
        isAddingTime.toggle()
    }
}

struct HabitDetailView_Previews: PreviewProvider {
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
        NavigationView {
            HabitDetailView(habitEntity: habitEntity)
        }
    }
}

