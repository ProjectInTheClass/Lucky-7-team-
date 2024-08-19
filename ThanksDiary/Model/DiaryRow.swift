//
//  DiaryRow.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//

//import SwiftUI
//
//struct DiaryRow: View {
//    var diary: Diary
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(diary.date)
//                .font(.headline)
//            Text(diary.text)
//                .font(.body)
//                .lineLimit(3)
//                .padding(.top, 2)
//            
//            HStack(){
//                Image(systemName: "hand.thumbsup")
//                Image(systemName: "text.bubble")
//            }.padding(.top)
//            
//        }
//        .padding()
//        
//    }
//}
//
//struct DiaryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DiaryRow(diary: Diary(text: "Example diary entry", date: "2023-08-07", timestamp: Date().timeIntervalSince1970))
//            .previewLayout(.sizeThatFits)
//    }
//}
import SwiftUI

struct DiaryRow: View {
    var diary: Diary

    var body: some View {
        HStack {
            Image(systemName: "leaf.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .padding(.trailing, 10)
                .foregroundColor(.green)

            VStack(alignment: .leading) {
                Text(diary.date)
                    .font(.headline)
                Text(diary.text)
                    .font(.body)
                    .lineLimit(3)
                    .padding(.top, 2)

                HStack {
                    Image(systemName: "hand.thumbsup")
                    Image(systemName: "text.bubble")
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading) // 추가: 부모 컨테이너의 최대 너비로 확장
        }
        .padding(.horizontal)
        .padding(.vertical, 10) // 상하 여백 추가
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(10)
        .frame(maxWidth: .infinity) // 추가: 부모 컨테이너의 최대 너비로 확장
    }
}

struct DiaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRow(diary: Diary(text: "Example diary entry", date: "2023-08-07", timestamp: Date().timeIntervalSince1970))
            .previewLayout(.sizeThatFits)
    }
}
