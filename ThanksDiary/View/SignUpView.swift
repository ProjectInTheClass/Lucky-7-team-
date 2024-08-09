//
//  SignUpView.swift
//  ThanksDiary
//
//  Created by my account on 8/9/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showToast: Bool = false  // 토스트 표시 상태
    @State private var navigateToLogin: Bool = false  // 로그인 화면으로의 네비게이션 상태
    
    var body: some View {
        VStack(spacing: 20) {
            Text("회원가입")
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
                signUp()
            }) {
                Text("회원가입")
                    .font(.title2)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                EmptyView()
            }
        }
        .padding()
        .toast(isShowing: $showToast, text: "회원가입 성공!")
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("회원가입 실패: \(error.localizedDescription)")
                return
            }
            
            // 회원가입 성공 시 토스트 알림 표시
            withAnimation {
                showToast = true
            }
            
            // 일정 시간 후 토스트를 숨기고 로그인 화면으로 이동
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showToast = false
                    navigateToLogin = true  // 로그인 화면으로 이동
                }
            }
        }
    }
}

// Toast View Modifier
extension View {
    func toast(isShowing: Binding<Bool>, text: String) -> some View {
        ZStack {
            self
            if isShowing.wrappedValue {
                VStack {
                    Spacer()
                    Text(text)
                        .font(.subheadline)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.slide)
                        .animation(.easeInOut)
                }
            }
        }
    }
}
