//
//  RandomtitleView.swift
//  ThanksDiary
//
//  Created by usg on 8/13/24.
//

import SwiftUI

struct RandomtitleView: View {
    var names = ["오랜만에 연락한 친구", "건강한 신체", "자기계발의 기회", "만족스러운 점심","깔끔한 자리", "문제해결을 도와준 사람","목표의 실현", "새로운 사람과의 만남","만족스러운 점심", "만족스러운 저녁","사회의 안전망","날씨에 맞는 옷","여행에서의 추억","사랑하는 가족","노력에 대한 감사","도움을 준 사람들에 대한 기억","맛있는 음식","새로 배운 것","목표를 향한 도전","자연의 아름다움","나른한 오후의 분위기","기술의 발전","운동의 기회","안정적인 재정 상태","바쁜 일상 속의 여유로움","성취감을 준 활동"]
    var randomname : String { names.randomElement() ?? "unknown"}
    //문자열이기 때문에 String 사용. randomElement 선언
    var body: some View {
        VStack{
            
            Text(randomname)
                .font(.largeTitle)
            Spacer()
            Image("luckyrabbit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400.0)
                .cornerRadius(10)
                .padding()
            
        }}}
#Preview {
    RandomtitleView()
}
