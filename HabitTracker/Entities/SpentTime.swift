//
//  SpentTime.swift
//  HabitTracker
//
//  Created by Valentin Mille on 04/03/2021.
//

import Foundation

struct SpentTime: Identifiable {
    var id = UUID().uuidString
    let date: Date
    let minutes: Int
}
