//
//  StatisticsView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var habitLibrary: HabitLibrary
    
    var body: some View {
        ScrollView {
            VStack {
                RankingView(habitLibrary: habitLibrary)
                    .padding()
                ForEach(habitLibrary.testHabits) { habit in
                    VStack(alignment: .leading, spacing: 32) {
                        Text(habit.name)
                            .font(.title)
                            .fontWeight(.bold)
                        StatisticsHabitView(habit: habit)
                            .frame(minHeight: 200)
                    }.padding()
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    @StateObject static var habitLibrary = HabitLibrary()
    
    static var previews: some View {
        StatisticsView(habitLibrary: habitLibrary)
    }
}
