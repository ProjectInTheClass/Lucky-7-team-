//
//  DiaryRow.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//

import SwiftUI

struct DiaryRow: View {
    var diary: Diary

    var body: some View {
        VStack(alignment: .leading) {
            Text(diary.date)
                .font(.headline)
            Text(diary.text)
                .font(.body)
                .lineLimit(3)
                .padding(.top, 2)
            
            HStack(){
                Image(systemName: "hand.thumbsup")
                Image(systemName: "text.bubble")
            }.padding(.top)
            
        }
        .padding()
    }
}

struct DiaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRow(diary: Diary(text: "Example diary entry", date: "2023-08-07", timestamp: Date().timeIntervalSince1970))
            .previewLayout(.sizeThatFits)
    }
}
