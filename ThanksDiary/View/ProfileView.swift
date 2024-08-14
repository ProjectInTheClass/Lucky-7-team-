//
//  ProfileView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct ProfileView: View {
    @State private var userEmail: String = Auth.auth().currentUser?.email ?? "Unknown"
    @State private var joinDate: String = "Not Available"
    @State private var showAlert: Bool = false
    @State private var navigateToMainView: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("내 정보")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("이메일:")
                        .font(.headline)
                        .foregroundColor(Color.green)
                    Spacer()
                    Text(userEmail)
                        .font(.body)
                        .foregroundColor(Color.black)
                }

                HStack {
                    Text("가입 날짜:")
                        .font(.headline)
                        .foregroundColor(Color.green)
                    Spacer()
                    Text(joinDate)
                        .font(.body)
                        .foregroundColor(Color.black)
                }
            }
            .padding()
            .background(Color.yellow.opacity(0.3))
            .cornerRadius(10)

            Spacer()

            Button(action: {
                showAlert = true
            }) {
                Text("로그아웃")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("로그아웃"),
                    message: Text("로그아웃 하시겠습니까?"),
                    primaryButton: .destructive(Text("로그아웃")) {
                        logout()
                    },
                    secondaryButton: .cancel()
                )
            }

            NavigationLink(destination: MainView(), isActive: $navigateToMainView) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("내 정보")
        .onAppear {
            fetchJoinDate()
        }
    }

    // 가입 날짜를 가져오는 함수
    private func fetchJoinDate() {
        guard let user = Auth.auth().currentUser else { return }
        let creationDate = user.metadata.creationDate ?? Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.joinDate = dateFormatter.string(from: creationDate)
    }

    private func logout() {
        do {
            try Auth.auth().signOut()
            // 로그아웃 후 메인 화면으로 이동
            navigateToMainView = true
        } catch {
            // 로그아웃 오류 처리
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
