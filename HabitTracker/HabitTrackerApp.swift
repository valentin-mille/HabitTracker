//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Valentin Mille on 26/01/2021.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(HabitLibrary())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
