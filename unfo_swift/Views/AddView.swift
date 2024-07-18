//
//  AddView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI
import SwiftData

struct AddView: View {

    @Environment(\.modelContext) private var context
    @Query private var cards: [Card]
    
    @State private var newWordFront = ""
    @State private var newWordBack = ""
    @State private var newTag = ""
    
    var body: some View {
        VStack(spacing:0){
            cardAddArea
                .overlay(titleArea, alignment: .top)
//            navigationArea
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: Card.self)
}

extension AddView {
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
    
    private var cardAddArea: some View{
        VStack {
            VStack {
                TextField("暗記したい言葉(表)", text: $newWordFront)
                    .padding(20)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                TextField("暗記したい言葉(裏)", text: $newWordBack)
                    .padding(20)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                
                HStack {
                    Text("タグ")
                    Spacer()
                    TextField("#", text: $newTag)
                        .padding(8)
                        .frame(width: 115,height: 35)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(6)
                }
                .padding(.top, 10)
//                HStack {
//                    Text("勉強開始日")
//                    Spacer()
//                    DatePicker("", selection: $newDate, displayedComponents: .date)
//                }
            }
            .padding(30)
            .background(.white)
            .cornerRadius(36)
            .padding(.top, 72)
            .padding(24)
            
            Button(action: {
                add(card: newWordFront)
            }, label: {
                Text("追加")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
            Spacer()
        }
        .background(Color("Background"))
        
    }

        private func add(card: String) {
            let data = Card(wordFront: card, wordBack: card, tag: card)
            context.insert(data)
        }
    
        private func delete(card: Card) {
            context.delete(card)
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
