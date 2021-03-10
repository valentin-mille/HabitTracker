//
//  Habit.swift
//  HabitTracker
//
//  Created by Valentin Mille on 24/02/2021.
//

import Foundation

class Habit: Identifiable, ObservableObject {
    let id = UUID().uuidString
    @Published var imageUrl: URL?
    @Published var name: String
    var totalTime: Int {
        var sum = 0
        for slot in timeSlots {
            sum += slot.minutes
        }
        return sum
    }
    @Published var isFavorite: Bool
    @Published var description: String
    @Published var timeSlots: [SpentTime]
    
    init(imageUrl: URL?, name: String, isFavorite: Bool, description: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.isFavorite = isFavorite
        self.description = description
        self.timeSlots = []
    }
    
    init(habitEntity: HabitEntity) {
        self.imageUrl = habitEntity.imageUrl
        self.name = habitEntity.name
        self.isFavorite = habitEntity.isFavorite
        self.description = habitEntity.stringDescription
        self.timeSlots = []
    }

    init(config: NewHabitConfig) {
        self.imageUrl = config.imageUrl
        self.name = config.name
        self.description = config.description
        self.isFavorite = false
        self.timeSlots = []
    }
}
