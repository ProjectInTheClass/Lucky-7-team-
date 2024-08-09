//
//  CalendarView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            Text("감사일기 달력")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            DatePicker(
                "날짜 선택",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
        }.navigationTitle("감사일기 달력")
    }
}


#Preview {
    CalendarView()
}
