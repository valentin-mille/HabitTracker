//
//  HomeView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 26/01/2021.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingHabitCreation: Bool = false
    @ObservedObject var habitLibrary: HabitLibrary
    @State private var isShowingFavoritesOnly = false
    
    @FetchRequest(entity: HabitEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true)]) var habits: FetchedResults<HabitEntity>
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                ScrollView {
                    VStack {
                        ForEach(habits) { habitEntity in
                            if habitEntity.isFavorite || !isShowingFavoritesOnly {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(Color.white)
                                        .shadow(color: Color(Color.RGBColorSpace.sRGB, white: 0, opacity: 0.2), radius: 4, x: 0.0, y: 0.0)
                                    NavigationLink(
                                        destination: HabitDetailView(habitEntity: habitEntity),
                                        label: {
                                            HabitCellView(habitEntity: habitEntity)
                                                .foregroundColor(.black)
                                        })
                                }.animation(.default)
                            }
                        }
                    }.padding(.horizontal, 16)
                }.navigationTitle(Text("My Habits"))
                .navigationBarItems(trailing: Toggle(isOn: $isShowingFavoritesOnly, label: {
                    Text("❤️ only")
                }))
                AddHabitButton(action: {
                    isShowingHabitCreation.toggle()
                }).sheet(isPresented: $isShowingHabitCreation, content: {
                    HabitCreationView(habitLibrary: habitLibrary)
                }).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var habitLibrary = HabitLibrary()
    static var previews: some View {
        HomeView(habitLibrary: habitLibrary)
    }
}
