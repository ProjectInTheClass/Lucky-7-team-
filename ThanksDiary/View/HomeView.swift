//
//  HomeView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

//import SwiftUI
//
//struct HomeView: View {
//    @EnvironmentObject var diaryData: DiaryData
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(diaryData.diaries) { diary in
//                    NavigationLink(destination: DiaryDetailView(diary: diary)) {
//                        DiaryRow(diary: diary)
//                    }
//                }
//                .onDelete(perform: delete)
//            }
//            .navigationTitle("📖 감사 일기 📖")
//            .navigationBarTitleDisplayMode(.inline)
//            .onAppear {
//                diaryData.fetchDiaries()
//            }
//        }
//    }
//
//    private func delete(at offsets: IndexSet) {
//            for index in offsets {
//                let diary = diaryData.diaries[index]
//                diaryData.deleteDiary(diary: diary)
//            }
//        }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environmentObject(DiaryData())
//    }
//}

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var diaryData: DiaryData
    @State private var searchValue: String = ""
    @State private var tagValue: String = ""
    
    var filteredDiaries: [Diary] {
        diaryData.diaries.filter { diary in
            (searchValue.isEmpty || diary.text.contains(searchValue)) &&
            (tagValue.isEmpty || diary.text.contains(tagValue))
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("“당신의 꾸준함입니다.\n노력하는 당신을 응원합니다!”")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                HStack {
                    TextField("Search", text: $searchValue)
                        .padding(.leading, 10)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        )
                    
                    TextField("#tag", text: $tagValue)
                        .padding(.leading, 10)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                List {
                    ForEach(filteredDiaries) { diary in
                        NavigationLink(destination: DiaryDetailView(diary: diary)) {
                            DiaryRow(diary: diary)
                        }
                    }
                    .onDelete(perform: delete)
                }
                .navigationTitle("📖 감사 일기 📖")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    diaryData.fetchDiaries()
                }
            }
        }
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let diary = diaryData.diaries[index]
            diaryData.deleteDiary(diary: diary)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(DiaryData())
    }
}
