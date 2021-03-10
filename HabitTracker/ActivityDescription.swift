//
//  ActivityDescription.swift
//  HabitTracker
//
//  Created by Valentin Mille on 27/01/2021.
//

import SwiftUI

struct ActivityDescription: View {
    var body: some View {
        Text("Running")
            .font(.title2)
            .fontWeight(.semibold)
        Text("Total: 85 minutes")
    }
}

struct ActivityDescription_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDescription()
    }
}
