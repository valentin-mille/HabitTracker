//
//  HabitCreationView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 28/02/2021.
//

import SwiftUI

struct HabitCreationView: View {
    @State var habitConfig = NewHabitConfig()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habitLibrary: HabitLibrary
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Habit name", text: $habitConfig.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextEditor(text: $habitConfig.description)
                        .border(Color.gray, width: 1)
                        .frame(height: 150)
                }.padding()
                CoverSelectionView(selectedUrl: $habitConfig.imageUrl)
            }.navigationTitle("New habit")
            .navigationBarItems(trailing: Button(action: {
                let newHabit = HabitEntity(context: viewContext)
                newHabit.id = UUID()
                newHabit.name = habitConfig.name
                newHabit.stringDescription = habitConfig.description
                newHabit.imageUrl = habitConfig.imageUrl
                newHabit.isFavorite = false
                do {
                    try viewContext.save()
                } catch {
                    print("Error: cannot save new data in context.")
                }
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Valid")
            }))
        }
    }
}

struct HabitCreationView_Previews: PreviewProvider {
    @ObservedObject static var habitLibrary = HabitLibrary()
    static var previews: some View {
        HabitCreationView(habitLibrary: habitLibrary)
    }
}
