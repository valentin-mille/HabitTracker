//
//  HabitCellView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 24/02/2021.
//

import SwiftUI
import Kingfisher

struct HabitCellView: View {
    @State var habit: Habit

    var body: some View {
        HStack {
            KFImage(habit.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(habit.name)
                    .font(.system(.title2))
                    .fontWeight(.semibold)
                Text("Total : \(habit.totalTime) minute(s)")
            }
            Spacer()
            FavoriteButtonView(isLiked: $habit.isFavorite, onColor: .red, offColor: .gray)
        }.padding(8)
    }
}

struct HabitCellView_Previews: PreviewProvider {
    static let testHabit = Habit(imageUrl: URL(string: "https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"), name: "Running", isFavorite: false, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
    static var previews: some View {
        HabitCellView(habit: testHabit).previewLayout(.sizeThatFits)
    }
}
