//
//  RandomView.swift
//  ThanksDiary
//
//  Created by my account on 8/9/24.
//


import SwiftUI

struct RandomView: View {
    // 미리 정의된 주제 목록
    let topics = ["바다", "하늘", "산", "나무", "친구", "가족", "음식", "여행", "음악", "책"]
    
    // 랜덤 주제를 저장할 상태 변수
    @State private var selectedTopic: String = "랜덤주제를 눌러보세요!"

    var body: some View {
        VStack(spacing: 20) {
            Text("랜덤 주제")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text(selectedTopic)
                .font(.title)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                .onTapGesture {
                    generateRandomTopic()
                }

            Spacer()
        }
        .padding()
        .navigationTitle("랜덤 주제")
    }

    // 랜덤 주제를 선택하는 함수
    private func generateRandomTopic() {
        if let randomTopic = topics.randomElement() {
            selectedTopic = "주제: \(randomTopic)"
        }
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}
