//
//  DiaryView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//
import SwiftUI

struct DiaryView: View {
    @State private var diaryText: String = ""
    @State private var selectedDate: Date = Date()
    @EnvironmentObject var diaryData: DiaryData

    var body: some View {
        NavigationView {
            VStack {
//                DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
//                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .padding()

                TextEditor(text: $diaryText)
                    .border(Color.gray, width: 1)
                    .padding()
                    .frame(height: 300)
                
                Button(action: {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let dateString = dateFormatter.string(from: selectedDate)
                    let newDiary = Diary(text: diaryText, date: dateString)
                    diaryData.addDiary(diary: newDiary)
                    diaryText = ""
                }) {
                    Text("저장")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("오늘의 감사")
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView().environmentObject(DiaryData())
    }
}

