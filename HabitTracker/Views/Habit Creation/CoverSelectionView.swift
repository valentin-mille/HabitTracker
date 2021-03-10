//
//  CoverSelectionView.swift
//  HabitTracker
//
//  Created by Valentin Mille on 28/02/2021.
//

import SwiftUI
import Kingfisher

struct CoverSelectionView: View {
    private let urls = listOfUrls
    private let layout = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    @Binding var selectedUrl: URL?
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 2) {
            ForEach(urls, id: \.self) { url in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .onTapGesture {
                            selectedUrl = url
                        }
                    if (url == selectedUrl) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .border(Color.blue, width: 3)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 22))
                            .padding()
                    }
                }
            }
        }
    }
}

struct CoverSelectionView_Previews: PreviewProvider {
    @State static var selectedUrl: URL? = nil
    static var previews: some View {
        CoverSelectionView(selectedUrl: $selectedUrl)
    }
}
