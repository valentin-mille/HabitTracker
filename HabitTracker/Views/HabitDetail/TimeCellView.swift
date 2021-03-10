//
//  TimeCellView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 04/03/2021.
//

import SwiftUI

struct TimeCellView: View {
    let spentTime: SpendTimeEntity
    
    var body: some View {
        HStack {
            Text("\(spentTime.minutes) min")
                .fontWeight(.semibold)
            Spacer()
            Text(stringData(date: spentTime.date))
        }
    }
    
    private func stringData(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
}

struct TimeCellView_Previews: PreviewProvider {
    static private let persistenceController = PersistenceController.preview
    static private let time: SpendTimeEntity = {
        let timeEntity = SpendTimeEntity(context: persistenceController.container.viewContext)
        timeEntity.id = UUID()
        timeEntity.date = Date()
        timeEntity.minutes = 36
        return timeEntity
    }()

    static var previews: some View {
        TimeCellView(spentTime: time)
    }
}
