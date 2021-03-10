//
//  HabitCellView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 24/02/2021.
//

import SwiftUI
import Kingfisher

struct HabitCellView: View {
    @ObservedObject var habitEntity: HabitEntity

    var body: some View {
        HStack {
            KFImage(habitEntity.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(habitEntity.name)
                    .font(.system(.title2))
                    .fontWeight(.semibold)
                Text("Total : \(habitEntity.totalMinutesSpend()) minute(s)")
            }
            Spacer()
            FavoriteButtonView(isLiked: $habitEntity.isFavorite, onColor: .red, offColor: .gray)
        }.padding(8)
    }
}

struct HabitCellView_Previews: PreviewProvider {
    static private let persistentController = PersistenceController.preview
    static private let habitEntity: HabitEntity = {
        let habitEntity = HabitEntity(context: persistentController.container.viewContext)
        habitEntity.id = UUID()
        habitEntity.name = "Habit test"
        habitEntity.stringDescription = "Description test"
        habitEntity.isFavorite = false
        habitEntity.imageUrl = URL(string: "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
        return habitEntity
    }()
    static var previews: some View {
        HabitCellView(habitEntity: habitEntity).previewLayout(.sizeThatFits)
    }
}
