//
//  ContentView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing:0){
            
            cardArea
                .overlay(titleArea, alignment: .top)
            
            
            navigationArea
        }
        
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
    
    private var cardArea: some View{
        ScrollViewReader { proxy in
            //カードエリア
            ScrollView{
                VStack {
                    ForEach (0..<5) { _ in
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .frame(width: 20, height: 4)
                            }
                            .padding(5)
//                            .background(Color("Accent"))
                            
                            
                            
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Spacer()
                                Text("unforgettable")
                                    .font(.title)
                                    .padding(42)
                                Spacer()
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            VStack {
                                HStack {
                                    Text("勉強日:2024/7/18")
                                    Text("#英単語")
                                }
                                Capsule()
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(36)
                    }
                    
                }
                .padding(.top, 72)
            }
            .padding(24)
            .background(Color("Background"))
        }
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
