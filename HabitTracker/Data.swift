//
//  Data.swift
//  HabitTracker
//
//  Created by Valentin Mille on 24/02/2021.
//

import Foundation

class HabitLibrary: ObservableObject {
    @Published var testHabits = [
        Habit(imageUrl: URL(string: "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"), name: "Running", isFavorite: false, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        Habit(imageUrl: URL(string: "https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"), name: "Coding", isFavorite: true, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        Habit(imageUrl: URL(string: "https://images.pexels.com/photos/3007370/pexels-photo-3007370.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"), name: "Reading", isFavorite: true, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
    ]
}

let listOfUrls = [
    URL(string: "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/936094/pexels-photo-936094.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/374147/pexels-photo-374147.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/373941/pexels-photo-373941.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/3060324/pexels-photo-3060324.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/3760529/pexels-photo-3760529.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/4974915/pexels-photo-4974915.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/1436618/pexels-photo-1436618.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/2147042/pexels-photo-2147042.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/374074/pexels-photo-374074.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/810775/pexels-photo-810775.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/786003/pexels-photo-786003.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
    URL(string: "https://images.pexels.com/photos/160107/pexels-photo-160107.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
]
