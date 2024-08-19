//
//  CalendarView.swift
//  ThanksDiary
//
//  Created by my account on 8/6/24.
//
//



import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var diaryData: DiaryData
    @State private var selectedDate: Date = Date()
    private let calendar = Calendar.current

    var body: some View {
        VStack {
//            Text("감사일기 달력")
//                .font(.largeTitle)
//                .bold()
//                .padding()

            // 캘린더 뷰
            let month = calendar.component(.month, from: selectedDate)
            let year = calendar.component(.year, from: selectedDate)
        
            
            let monthStart = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
            let monthRange = calendar.range(of: .day, in: .month, for: selectedDate)!
            let firstWeekday = calendar.component(.weekday, from: monthStart) - 1 // 0 based index
            
            VStack {
                Text(formattedMonthYear(from: selectedDate))
                                    .font(.title)
                
//                Text("\(year)년 \(month)월")
//                    .font(.title)
                
                HStack {
                    ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \.self) { day in
                        Text(day)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    Text("")
                    Text("")
                    Text("")
                    Text("")
//                    ForEach(0..<firstWeekday, id: \.self) { _ in
//                        Text("")
//                            .frame(maxWidth: .infinity)
//                    }
                    
                    ForEach(1..<monthRange.count + 1, id: \.self) { day in
                        let currentDate = calendar.date(byAdding: .day, value: day - 1, to: monthStart)!
                        
                        ZStack {
                            // Check if this day has a diary entry
                            if diaryData.diaries.contains(where: { isSameDay(date1: $0.date, date2: currentDate) }) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.yellow.opacity(0.5))
                                    .frame(height: 40)
                            }
                            
                            Text("\(day)")
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .background(calendar.isDate(currentDate, inSameDayAs: selectedDate) ? Color.green : Color.clear)
                                .cornerRadius(4)
                        }
                        .onTapGesture {
                            selectedDate = currentDate
                        }
                    }
                }
            }
            .padding()

            Text("선택한 날짜: \(selectedDate, formatter: dateFormatter)")
                .padding()

            Divider()

            List(diaryData.diaries.filter { diary in
                isSameDay(date1: diary.date, date2: selectedDate)
            }) { diary in
                VStack(alignment: .leading) {
                    Text(diary.text)
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(8)
                }
            }
        }
    }

    // 두 날짜가 같은지 비교하는 함수
    private func isSameDay(date1: String, date2: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let diaryDate = dateFormatter.date(from: date1) else { return false }
        return Calendar.current.isDate(diaryDate, inSameDayAs: date2)
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy년 M월 d일"  // 원하는 날짜 형식을 직접 지정
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        return formatter
    }
    
    private func formattedMonthYear(from date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            formatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
            return formatter.string(from: date)
        }
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(DiaryData())
    }
}
