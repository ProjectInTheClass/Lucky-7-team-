//
//  CommentsView.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//

//import SwiftUI
//
//struct CommentsView: View {
//    @EnvironmentObject var diaryData: DiaryData
//    var diary: Diary
//    @State private var commentText: String = ""
//
//    var body: some View {
//        VStack {
//            List {
//                ForEach(diary.comments) { comment in
//                    VStack(alignment: .leading) {
//                        Text(comment.text)
//                        Text(comment.date)
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                    }
//                }
//            }
//            HStack {
//                TextField("Add a comment", text: $commentText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: {
//                    diaryData.addComment(to: diary, commentText: commentText)
//                    commentText = ""
//                }) {
//                    Text("Post")
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Comments")
//    }
//}
//
//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(diary: Diary(id: "1", text: "Sample diary text", date: "2024-08-06"))
//            .environmentObject(DiaryData())
//    }
//}
