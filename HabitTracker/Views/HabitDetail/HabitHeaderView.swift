//
//  HabitHeaderView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 04/03/2021.
//

import SwiftUI
import Kingfisher

struct HabitHeaderView: View {
    @ObservedObject var habitEntity: HabitEntity
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(habitEntity.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            LinearGradient(gradient: Gradient(colors: [Color(white: 0, opacity: 0.5), .clear]), startPoint: .bottom, endPoint: .top)
                .frame(height: 100)
            HStack {
                Text(habitEntity.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                FavoriteButtonView(isLiked: $habitEntity.isFavorite, onColor: .red, offColor: .white)
            }
        }
    }
}

struct HabitHeaderView_Previews: PreviewProvider {
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
        HabitHeaderView(habitEntity: habitEntity)
    }
}
