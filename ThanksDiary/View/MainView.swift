//
//  MainView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI

enum NavigationDestination: Hashable {
    case login
    case signUp
}

struct MainView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 40) {
                Text("🍀")
                    .font(.system(size: 200))
                    .frame(maxHeight: .infinity)

                Text("감사일기")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)

                VStack(spacing: 20) {
                    Button(action: {
                        path.append(NavigationDestination.login)
                    }) {
                        Text("로그인    ")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        path.append(NavigationDestination.signUp)
                    }) {
                        Text("회원가입")
                            .font(.title2)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 40)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .navigationBarHidden(true)
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .login:
                    LoginView()
                case .signUp:
                    SignUpView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
