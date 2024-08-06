//
//  ProfileView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("내 정보 화면")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("내 정보")
        }
    }
}

#Preview {
    ProfileView()
}
