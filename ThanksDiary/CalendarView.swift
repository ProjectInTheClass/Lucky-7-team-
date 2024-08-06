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
            Text("달력")
                .font(.title)
                .padding()
            
            DatePicker(
                "날짜 선택",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
        }
    }
}


#Preview {
    CalendarView()
}
