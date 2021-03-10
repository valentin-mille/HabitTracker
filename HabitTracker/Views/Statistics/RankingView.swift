//
//  RankingView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct RankingView: View {
    @ObservedObject var habitLibrary: HabitLibrary

    var body: some View {
        HStack(alignment: .bottom) {
            let habit = rankedHabit()
            PodiumStep(habit: habit[0], rank: .first)
            PodiumStep(habit: habit[1], rank: .second)
            PodiumStep(habit: habit[2], rank: .third)
        }
    }
    
    private func rankedHabit() -> [Habit] {
        let sortedHabits = habitLibrary.testHabits.sorted { $0.totalTime > $1.totalTime }
        return Array(sortedHabits.prefix(upTo: 3))
    }
}

private struct PodiumStep: View {
    @ObservedObject var habit: Habit
    let rank: Rank
    
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Text("\(habit.totalTime) min")
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
    @StateObject static var habitLibrary = HabitLibrary()
    
    static var previews: some View {
        RankingView(habitLibrary: habitLibrary)
    }
}
