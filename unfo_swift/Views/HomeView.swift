//
//  ContentView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query private var cards: [Card]
    
    var body: some View {
        VStack(spacing:0){
            
            CardListView()
                .overlay(titleArea, alignment: .top)
            
//            navigationArea
        }
        .modelContainer(for: Card.self)
        
    }
}

#Preview {
    HomeView()
}


extension HomeView {
    private var titleArea: some View {
        // タイトルエリア
        HStack {
            Spacer()
            Text("今日のカード")
                .font(.title2.bold())
            Spacer()
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
