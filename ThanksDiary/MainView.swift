//
//  MainView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    Text("🍀")
                        .font(.system(size: geometry.size.width * 0.5))
                        .frame(height: geometry.size.height * 0.4)
                    
                    Text("감사일기")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    NavigationLink(destination: ContentView()) {
                        Text("시작하기")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 40)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .navigationTitle("")
            }
        }
    }
}


#Preview {
    MainView()
}
