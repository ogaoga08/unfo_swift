//
//  SettingsView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("ここはSettings.Viewです")
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var titleArea: some View {
        // タイトルエリア
        HStack {
            Text("カードを追加")
                .font(.title2.bold())
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("Background").opacity(0.9))
    }
    
    private var navigationArea: some View {
        //ナビゲーションエリア
        HStack{
            Spacer()
            Image(systemName: "rectangle.stack")
            Spacer()
            Image(systemName: "rectangle.badge.plus")
            Spacer()
            Image(systemName: "gearshape")
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 20)
        .background(Color(uiColor: .systemBackground))
    }
}


