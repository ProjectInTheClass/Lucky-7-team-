//
//  ContentView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var diaryData = DiaryData()

    var body: some View {
        TabView {
            
            RandomView()
                .tabItem {
                    Image(systemName: "envelope")
                    Text("랜덤주제")
                }

            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("달력")
                    
                }.environmentObject(diaryData)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
                .environmentObject(diaryData)
            
            DiaryView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("일기쓰기")
                }
                .environmentObject(diaryData)
            
            ProfileView()
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
