//
//  HomeView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var diaryData: DiaryData

    var body: some View {
        NavigationView {
            List {
                ForEach(diaryData.diaries) { diary in
                    NavigationLink(destination: DiaryDetailView(diary: diary)) {
                        DiaryRow(diary: diary)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("감사 일기")
            .onAppear {
                diaryData.fetchDiaries()
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



