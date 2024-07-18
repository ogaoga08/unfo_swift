//
//  CardListView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/18.
//

import SwiftUI
import SwiftData

struct CardListView: View {
    @Query private var cards: [Card]
    @Environment(\.modelContext) private var context
    @State private var tappedCardId: PersistentIdentifier?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView{
                VStack {
                    ForEach (cards) { card in
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                        delete(card: card)
                                }, label: {
                                    Image(systemName: "minus.circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                })
                                
                            }
                            .padding(5)
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Spacer()
                                VStack {
                                    if tappedCardId == card.id {
                                        Text("\(card.wordBack)")
                                            .font(.title)
                                            .padding(42)
                                            .onTapGesture {
                                                tappedCardId = nil
                                            }
                                    } else {
                                        Text("\(card.wordFront)")
                                            .font(.title)
                                            .padding(42)
                                            .onTapGesture {
                                                tappedCardId = card.id
                                            }
                                    }
                                }
                                
                                Spacer()
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            VStack {
                                HStack {
                                    Text("#\(card.wordTag)")
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
            .padding(.horizontal, 24)
            .background(Color("Background"))
        }
    }
    
    private func delete(card: Card) {
        context.delete(card)
//        try? context.save()
    }
}

#Preview {
    CardListView()
        .modelContainer(for: Card.self)
}
