//
//  Card.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import Foundation
import SwiftData

@Model
final class Card: Identifiable {
    var id: UUID = UUID()
    let wordFront: String
    let wordBack: String
    let wordTag: String
//    let date: Date
    
    init(wordFront: String, wordBack: String, wordTag: String) {
//        self.id = id
        self.wordFront = wordFront
        self.wordBack = wordBack
        self.wordTag = wordTag
//        self.date = date
    }
    
//    var isCardToday: Bool {
//        Calendar.current.isDateInToday(date)
//    }
}
