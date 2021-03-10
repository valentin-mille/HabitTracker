//
//  AddHabitButton.swift
//  HabitTracker
//
//  Created by Valentin Mille on 24/02/2021.
//

import SwiftUI

struct AddHabitButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
            }.shadow(radius: 10)
        })
    }
}

struct AddHabitButton_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitButton(action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
