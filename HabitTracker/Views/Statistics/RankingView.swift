//
//  RankingView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct RankingView: View {
    @FetchRequest(entity: HabitEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \HabitEntity.name, ascending: true)]) var habits: FetchedResults<HabitEntity>

    var body: some View {
        HStack(alignment: .bottom) {
            let habit = rankedHabit()
            if habit.count >= 1 {
                PodiumStep(habit: habit[0], rank: .first)
            }
            if habit.count >= 2 {
                PodiumStep(habit: habit[1], rank: .second)
            }
            if habit.count >= 3 {
                PodiumStep(habit: habit[2], rank: .third)
            }
        }
    }
    
    private func rankedHabit() -> [HabitEntity] {
        let sortedHabits = habits.sorted { $0.totalMinutesSpend() > $1.totalMinutesSpend() }
        var habitNumberToGet = 3
        if sortedHabits.count < 3 {
            habitNumberToGet = sortedHabits.count
        }
        return Array(sortedHabits.prefix(upTo: habitNumberToGet))
    }
}

private struct PodiumStep: View {
    @ObservedObject var habit: HabitEntity
    let rank: Rank
    
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Text("\(habit.totalMinutesSpend()) min")
                .font(.footnote)
                .fontWeight(.light)
            ZStack {
                Rectangle()
                    .frame(height: 30 + CGFloat((3 - rank.rawValue) * 20))
                    .foregroundColor(Color(white: 0.9))
                    .cornerRadius(5)
                switch rank {
                    case .first:
                        Text("🥇")
                    case .second:
                        Text("🥈")
                    case .third:
                        Text("🥉")
                }
            }.font(.system(size: 28))
        }
    }
}

private enum Rank: Int {
    case first = 1
    case second = 2
    case third = 3
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
