//
//  HabitDescriptionView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 04/03/2021.
//

import SwiftUI

struct HabitDescriptionView: View {
    let description: String?
    let minutes: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                if let description = description {
                    Text(description)
                }
                Text("Total time: \(minutes) minutes")
                    .fontWeight(.semibold)

            }.foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct HabitDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HabitDescriptionView(description: "It is a habit description", minutes: 50)
            HabitDescriptionView(description: nil, minutes: 50)
        }.previewLayout(.sizeThatFits)
    }
}
