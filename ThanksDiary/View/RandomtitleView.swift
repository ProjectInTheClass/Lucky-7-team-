//
//  RandomtitleView.swift
//  ThanksDiary
//
//  Created by my account on 8/17/24.
//

import SwiftUI

struct RandomtitleView: View {
    var names = [
        "오늘 만난 친절한 사람",
        "건강한 몸과 마음",
        "사랑하는 가족",
        "좋은 친구들",
        "안전한 집",
        "맛있는 음식",
        "아름다운 날씨",
        "편안한 침대",
        "흥미로운 책",
        "즐거운 취미 활동",
        "도움을 준 동료",
        "여행에서의 추억",
        "성취한 목표",
        "새로 배운 것",
        "따뜻한 커피나 차",
        "음악과 예술",
        "집에서의 편안함",
        "편리한 교통수단",
        "감사한 직장이나 업무 환경",
        "아이들의 웃음",
        "도움을 준 전문가나 멘토",
        "자연의 아름다움",
        "여유로운 시간",
        "새로운 친구와의 만남",
        "기술의 발전",
        "건강한 식사",
        "운동의 기회",
        "안정적인 재정 상태",
        "유익한 정보나 뉴스",
        "재능과 능력",
        "문제 해결을 도와준 사람",
        "사랑하는 반려동물",
        "자기계발의 기회",
        "긍정적인 피드백",
        "사회의 안전망",
        "날씨에 맞는 옷",
        "생산적인 하루",
        "성취감을 주는 프로젝트",
        "편리한 생활용품",
        "감동적인 영화나 드라마",
        "지원해준 커뮤니티",
        "삶의 작은 기쁨",
        "평화로운 순간",
        "유용한 기술 도구",
        "따뜻한 대화",
        "기억에 남는 경치",
        "마음을 다스리는 명상",
        "의미 있는 자원봉사 경험",
        "가족과의 소중한 시간",
        "자신에게 주는 사랑과 배려"
    ]
    
    var randomname: String { names.randomElement() ?? "unknown" }

    var body: some View {
        VStack(spacing: 20) {
            Text("주제")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()

            // 흰색 배경과 검정색 라인으로 둘러싸인 사각형 안에 텍스트 추가
            Rectangle()
                .fill(Color.white)
                .frame(height: 100)
                .overlay(
                    Text(randomname)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                )
                .cornerRadius(10)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding()

            Spacer()
            
            Image("luckyrabbit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400.0)
                .cornerRadius(10)
                .padding()
        }
        Spacer()
    }
}

#Preview {
    RandomtitleView()
}


