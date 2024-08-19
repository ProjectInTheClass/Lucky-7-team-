//
//  DiaryDetailView.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.

import SwiftUI

struct DiaryDetailView: View {
    @EnvironmentObject var diaryData: DiaryData
    @State private var isEditing: Bool = false
    @State private var diaryText: String
    @State private var selectedDate: Date
    @Environment(\.presentationMode) var presentationMode
    var diary: Diary

    init(diary: Diary) {
        self.diary = diary
        _diaryText = State(initialValue: diary.text)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        _selectedDate = State(initialValue: dateFormatter.date(from: diary.date) ?? Date())
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if isEditing {
                TextEditor(text: $diaryText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                    .frame(height: 300)

                Button(action: {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let dateString = dateFormatter.string(from: selectedDate)
                    let updatedDiary = Diary(id: diary.id, text: diaryText, date: dateString, timestamp: Date().timeIntervalSince1970)
                    diaryData.updateDiary(diary: updatedDiary)
                    isEditing.toggle()
                }) {
                    Text("저장")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    Text(diary.date)
                        .font(.largeTitle)
                        .padding(.bottom, 10)

                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                        .background(Color.white.opacity(0.3))
                        .frame(minHeight: 150)
                        .overlay(
                            Text(diary.text)
                                .font(.body)
                                .padding()
                        )
                        .padding(.horizontal)
                        //.background(Color.pink.opacity(0.2))
                        .cornerRadius(10)
                }

                HStack {
                    Spacer()

                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text("수정")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal)

                    Button(action: {
                        diaryData.deleteDiary(diary: diary)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("삭제")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationTitle("일기 보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diary: Diary(id: UUID().uuidString, text: "Example diary entry", date: "2023-08-07", timestamp: Date().timeIntervalSince1970))
            .environmentObject(DiaryData())
    }
}
