//
//  RandomView.swift
//  ThanksDiary
//
//  Created by my account on 8/9/24.


import SwiftUI

struct RandomView: View {
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    VStack {
                        // 💌 이모티콘에 NavigationLink 추가
                        NavigationLink(destination: RandomtitleView()) {
                            Text("💌")
                                .font(.system(size: geometry.size.width * 0.5))
                                .frame(height: geometry.size.height * 0.4)
                        }

                        Text("주제가 도착했어요!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    // GeometryReader의 VStack을 가운데 정렬
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .navigationTitle("🍀오늘의 주제🍀")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    RandomView()
}

