//
//  RandomView.swift
//  ThanksDiary
//
//  Created by my account on 8/9/24.
//

import SwiftUI

struct RandomView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("랜덤 주제 화면")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationTitle("랜덤 주제")
        }
    }
}

#Preview {
    RandomView()
}
