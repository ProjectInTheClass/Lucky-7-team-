//
//  DiaryData.swift
//  ThanksDiary
//
//  Created by my account on 8/7/24.
//
import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import Combine

class DiaryData: ObservableObject {
    @Published var diaries: [Diary] = []
    private var ref: DatabaseReference = Database.database().reference()
    
    init() {
        fetchDiaries()
    }

//    func fetchDiaries() {
//        ref.child("diaries").observe(.value) { snapshot in
//            var fetchedDiaries: [Diary] = []
//            for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                   let diary = try? snapshot.data(as: Diary.self) {
//                    fetchedDiaries.append(diary)
//                }
//            }
//            self.diaries = fetchedDiaries
//        }
//    }
    
    func fetchDiaries() {
            ref.child("diaries").observe(.value) { snapshot in
                var fetchedDiaries: [Diary] = []
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                       let diary = try? snapshot.data(as: Diary.self) {
                        fetchedDiaries.append(diary)
                    }
                }
                DispatchQueue.main.async {
                    self.diaries = fetchedDiaries.sorted { $0.timestamp > $1.timestamp }
                }
            }
        }

    func addDiary(diary: Diary) {
        do {
            try ref.child("diaries").child(diary.id).setValue(from: diary)
        } catch {
            print("Error adding diary: \(error.localizedDescription)")
        }
    }
    
//    func addDiary(diaryText: String) {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            let dateString = dateFormatter.string(from: Date())
//            let newDiary = Diary(id: UUID().uuidString, text: diaryText, date: dateString, timestamp: Date().timeIntervalSince1970)
//            do {
//                try ref.child("diaries").child(newDiary.id).setValue(from: newDiary)
//            } catch {
//                print("Error adding diary: \(error.localizedDescription)")
//            }
//        }

    func deleteDiary(diary: Diary) {
        ref.child("diaries").child(diary.id).removeValue { error, _ in
            if let error = error {
                print("Error deleting diary: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.diaries.removeAll { $0.id == diary.id }
                }
            }
        }
    }

    func updateDiary(diary: Diary) {
        do {
            try ref.child("diaries").child(diary.id).setValue(from: diary)
            if let index = diaries.firstIndex(where: { $0.id == diary.id }) {
                diaries[index] = diary
            }
        } catch {
            print("Error updating diary: \(error.localizedDescription)")
        }
    }

//    func likeDiary(diary: Diary) {
//        var updatedDiary = diary
//        updatedDiary.likes += 1
//        updateDiary(diary: updatedDiary)
//    }
//
//    func addComment(to diary: Diary, commentText: String) {
//        var updatedDiary = diary
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: Date())
//        let newComment = Comment(id: UUID().uuidString, text: commentText, date: dateString)
//        updatedDiary.comments.append(newComment)
//        updateDiary(diary: updatedDiary)
//    }
}

