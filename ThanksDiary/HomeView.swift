//
//  HomeView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                CalendarView()
                    .padding()
                
                Spacer()
            }
            .navigationTitle("홈")
        }
    }
}

#Preview {
    HomeView()
}
