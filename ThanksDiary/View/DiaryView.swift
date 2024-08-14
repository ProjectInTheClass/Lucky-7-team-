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
    @State private var showToast: Bool = false // 토스트 메시지 표시 상태

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                // 날짜 선택 뷰
                DatePicker("🌸 날짜 선택", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(.yellow)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                
                // 텍스트 입력 뷰
                TextEditor(text: $diaryText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                    .frame(height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.yellow, lineWidth: 2)
                    )
                
                // 저장 버튼
                Button(action: {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let dateString = dateFormatter.string(from: selectedDate)
                    let newDiary = Diary(text: diaryText, date: dateString, timestamp: Date().timeIntervalSince1970)
                    diaryData.addDiary(diary: newDiary)
                    diaryText = ""
                    showToastMessage() // 일기 작성 후 토스트 메시지 표시
                }) {
                    Text("💌 저장하기 💌")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGroupedBackground)) // 배경색 추가
            .navigationTitle("🌼 오늘의 감사 🌼")
            .navigationBarTitleDisplayMode(.inline)
            .overlay(
                VStack {
                    if showToast {
                        Text("일기 작성이 완료되었습니다!")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .transition(.opacity)
                            .zIndex(1)
                    }
                }
                .padding(.bottom, 50), alignment: .bottom
            )
        }
    }

    // 토스트 메시지를 표시하는 함수
    private func showToastMessage() {
        withAnimation {
            showToast = true
        }

        // 2초 후에 토스트 메시지를 숨김
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showToast = false
            }
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView().environmentObject(DiaryData())
    }
}

