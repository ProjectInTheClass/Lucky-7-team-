//
//  DiaryDetailView.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//
//
//import SwiftUI
//
//struct DiaryDetailView: View {
//    @EnvironmentObject var diaryData: DiaryData
//    @State private var isEditing: Bool = false
//    @State private var diaryText: String
//    @State private var selectedDate: Date
//    @Environment(\.presentationMode) var presentationMode
//    var diary: Diary
//
//    init(diary: Diary) {
//        self.diary = diary
//        _diaryText = State(initialValue: diary.text)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        _selectedDate = State(initialValue: dateFormatter.date(from: diary.date) ?? Date())
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            if isEditing {
////                DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
////                    .datePickerStyle(GraphicalDatePickerStyle())
////                    .padding()
//                
//                TextEditor(text: $diaryText)
//                    .border(Color.gray, width: 1)
//                    .padding()
//                    .frame(height: 300)
//
//                Button(action: {
//                    let dateFormatter = DateFormatter()
//                    dateFormatter.dateFormat = "yyyy-MM-dd"
//                    let dateString = dateFormatter.string(from: selectedDate)
//                    let updatedDiary = Diary(id: diary.id, text: diaryText, date: dateString)
//                    diaryData.updateDiary(diary: updatedDiary)
//                    isEditing.toggle()
//                }) {
//                    Text("저장")
//                        .font(.title)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//            } else {
//                Text(diary.date)
//                    .font(.largeTitle)
//                    .padding(.bottom, 10)
//
//                Text(diary.text)
//                    .font(.body)
//                
//                HStack {
//                    Button(action: {
//                        isEditing.toggle()
//                    }) {
//                        Text("수정")
//                            .font(.title)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//
//                    Button(action: {
//                        diaryData.deleteDiary(diary: diary)
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Text("삭제")
//                            .font(.title)
//                            .padding()
//                            .background(Color.red)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//                }
//            }
//
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("일기 보기")
//    }
//}
//
//struct DiaryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiaryDetailView(diary: Diary(id: UUID().uuidString, text: "Example diary entry", date: "2023-08-07"))
//            .environmentObject(DiaryData())
//    }
//}
//
//
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
                    .border(Color.gray, width: 1)
                    .padding()
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
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                Text(diary.date)
                    .font(.largeTitle)
                    .padding(.bottom, 10)

                // 사각형 틀 안에 일기 내용 표시
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
                    .background(Color.white) // 배경 색상을 지정하여 틀 안쪽을 채웁니다.
                    .frame(minHeight: 150)
                    .overlay(
                        Text(diary.text)
                            .font(.body)
                            .padding()
                    )
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text("수정")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    Button(action: {
                        diaryData.deleteDiary(diary: diary)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("삭제")
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    Spacer()
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("일기 보기")
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diary: Diary(id: UUID().uuidString, text: "Example diary entry", date: "2023-08-07", timestamp: Date().timeIntervalSince1970))
            .environmentObject(DiaryData())
    }
}
