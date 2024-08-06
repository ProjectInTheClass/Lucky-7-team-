//
//  ContentView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            NavigationView {
                DiaryView()
            }
                .tabItem {
                    Image(systemName: "pencil")
                    Text("일기쓰기")
                }
            
            NavigationView {
                ProfileView()
            }
            
                .tabItem {
                    Image(systemName: "person")
                    Text("내 정보")
                }
        }
    }
}


#Preview {
    ContentView()
}
