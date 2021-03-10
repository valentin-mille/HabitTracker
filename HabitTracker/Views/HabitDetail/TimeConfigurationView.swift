//
//  TimeConfigurationView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 04/03/2021.
//

import SwiftUI

struct TimeConfigurationView: View {
    @Binding var selectedMinutes: Int
    @Binding var selectedDate: Date

    var body: some View {
        VStack {
            Picker("Minute", selection: $selectedMinutes) {
                ForEach(0 ..< 60) {
                    Text("\($0)")
                        .rotationEffect(Angle(degrees: 90))
                }
            }.rotationEffect(Angle(degrees: -90))
            .frame(maxHeight: 50)
            .clipped()
            DatePicker("Choose a date", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
        }
    }
}

struct TimeConfigurationView_Previews: PreviewProvider {
    @State private static var selectedMinutes = 30
    @State private static var selectedDate = Date()

    static var previews: some View {
        TimeConfigurationView(selectedMinutes: $selectedMinutes, selectedDate: $selectedDate)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
