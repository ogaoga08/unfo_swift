//
//  unfo_swiftApp.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI
import SwiftData

@main
struct unfo_swiftApp: App {
    var body: some Scene {
        WindowGroup {
            NavigateView()
                .modelContainer(for: Card.self)
        }
    }
}
