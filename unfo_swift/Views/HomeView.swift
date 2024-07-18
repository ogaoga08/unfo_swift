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
            Text("今日のカード")
                .font(.title2.bold())
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("Background").opacity(0.9))
    }
    
//    private var cardArea: some View{
//        ScrollViewReader { proxy in
//            //カードエリア
//            ScrollView{
//                VStack {
//                    ForEach (card) { card in
//                        VStack {
//                            
//                            HStack {
//                                Spacer()
//                                Image(systemName: "ellipsis")
//                                    .resizable()
//                                    .frame(width: 20, height: 4)
//                            }
//                            .padding(5)
//                            HStack {
//                                Image(systemName: "checkmark.circle")
//                                    .resizable()
//                                    .frame(width: 24, height: 24)
//                                Spacer()
//                                Text(card.wordFront)
//                                    .font(.title)
//                                    .padding(42)
//                                Spacer()
//                                Image(systemName: "xmark.circle")
//                                    .resizable()
//                                    .frame(width: 24, height: 24)
//                            }
//                            VStack {
//                                HStack {
////                                    Text(card.date, format: .dateTime.month(.wide).day().year())
//                                    Text(card.tag)
//                                }
//                                Capsule()
//                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                            }
//                            
//                        }
//                        .padding()
//                        .background(.white)
//                        .cornerRadius(36)
//                    }
//                    
//                }
//                .padding(.top, 72)
//            }
//            .padding(24)
//            .background(Color("Background"))
//        }
//    }
    
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
