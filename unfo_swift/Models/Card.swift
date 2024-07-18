//
//  Card.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import Foundation
import SwiftData

@Model
final class Card {
//    let id: String
    let wordFront: String
    let wordBack: String
    let tag: String
//    let date: Date
    
    init(wordFront: String, wordBack: String, tag: String) {
//        self.id = id
        self.wordFront = wordFront
        self.wordBack = wordBack
        self.tag = tag
//        self.date = date
    }
    
//    var isCardToday: Bool {
//        Calendar.current.isDateInToday(date)
//    }
}
