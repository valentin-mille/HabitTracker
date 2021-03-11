//
//  StatisticsView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct StatisticsView: View {
    @FetchRequest(entity: HabitEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true)]) var habits: FetchedResults<HabitEntity>
    
    var body: some View {
        ScrollView {
            VStack {
                RankingView()
                    .padding()
                ForEach(habits) { habit in
                    VStack(alignment: .leading, spacing: 32) {
                        Text(habit.name)
                            .font(.title)
                            .fontWeight(.bold)
                        StatisticsHabitView(habitEntity: habit)
                            .frame(minHeight: 200)
                    }.padding()
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
