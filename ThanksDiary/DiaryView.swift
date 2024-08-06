//
//  DiaryView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI

struct DiaryView: View {
    @State private var diaryText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $diaryText)
                    .border(Color.gray, width: 1)
                    .padding()
                    .frame(height: 300)
                
                Button(action: {
                }) {
                    Text("저장")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("일기쓰기")
        }
    }
}


#Preview {
    DiaryView()
}
