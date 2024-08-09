//
//  Diary.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//

//import Foundation
//import FirebaseDatabase
//import FirebaseDatabaseSwift
//
//struct Diary: Identifiable, Codable {
//    var id: String = UUID().uuidString
//    var text: String
//    var date: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case text
//        case date
//    }
//}

import Foundation
import FirebaseDatabaseSwift

struct Diary: Identifiable, Codable {
    var id: String = UUID().uuidString
    var text: String
    var date: String
    var timestamp: TimeInterval
//    var likes: Int = 0
//    var comments: [Comment] = []

    enum CodingKeys: String, CodingKey {
        case id, text, date, timestamp
    }
}
