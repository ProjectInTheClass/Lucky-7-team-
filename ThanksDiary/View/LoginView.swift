//
//  LoginView.swift
//  ThanksDiary
//
//  Created by my account on 8/9/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false // 로그인 상태
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("로그인")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                TextField("이메일", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                
                SecureField("비밀번호", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                    login()
                }) {
                    Text("로그인")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // NavigationLink를 이용한 화면 전환
                NavigationLink(destination: ContentView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("로그인 실패: \(error.localizedDescription)")
                return
            }
            
            // 로그인 성공 시 ContentView로 이동
            isLoggedIn = true
        }
    }
}
