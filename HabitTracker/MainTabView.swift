//
//  MainTabView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 08/03/2021.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var habitLibrary: HabitLibrary
    
    var body: some View {
        TabView {
            HomeView(habitLibrary: habitLibrary)
                .tabItem { Image(systemName: "rectangle.grid.1x2") }
            StatisticsView()
                .tabItem { Image(systemName: "chart.bar") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
