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
        }
        .padding()
    }
}

struct DiaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRow(diary: Diary(text: "Example diary entry", date: "2023-08-07"))
            .previewLayout(.sizeThatFits)
    }
}


//import SwiftUI
//
//struct DiaryRow: View {
//    @EnvironmentObject var diaryData: DiaryData
//    var diary: Diary
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(diary.date)
//                .font(.headline)
//            Text(diary.text)
//                .font(.body)
//            
//            HStack {
//                Button(action: {
//                    diaryData.likeDiary(diary: diary)
//                }) {
//                    Image(systemName: "hand.thumbsup")
//                    Text("\(diary.likes)")
//                }
//
//                NavigationLink(destination: CommentsView(diary: diary)) {
//                    Image(systemName: "text.bubble")
//                    Text("\(diary.comments.count)")
//                }
//            }
//            .padding(.top, 5)
//        }
//    }
//}
//
//struct DiaryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DiaryRow(diary: Diary(id: "1", text: "Sample diary text", date: "2024-08-06"))
//            .environmentObject(DiaryData())
//    }
//}
