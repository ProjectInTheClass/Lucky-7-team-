//
//  Diary.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//

import Foundation
import FirebaseDatabaseSwift

struct Diary: Identifiable, Codable {
    var id: String = UUID().uuidString
    var text: String
    var date: String
    var timestamp: TimeInterval

    enum CodingKeys: String, CodingKey {
        case id, text, date, timestamp
    }
}
