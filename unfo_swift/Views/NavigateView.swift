//
//  NavigationView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI

struct NavigateView: View {
    init() {
        let appearance: UITabBarAppearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
       }
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "rectangle.stack")
                    Text("カード一覧")
                    
                }
            AddView()
                .tabItem {
                    Image(systemName: "rectangle.badge.plus")
                    Text("追加する")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("その他")
                }
        }
        .modelContainer(for: Card.self)
    }
        
}

#Preview {
    NavigateView()
}
