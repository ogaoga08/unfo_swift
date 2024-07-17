//
//  AddView.swift
//  unfo_swift
//
//  Created by 小笠原慎 on 2024/07/17.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldFront: String = ""
    @State var textFieldBack: String = ""
    @State var textFieldTag: String = ""
    @State var selectedDate: Date
    
    var body: some View {
        VStack(spacing:0){
            
            cardAddArea
                .overlay(titleArea, alignment: .top)

            navigationArea
        }
    }
}

#Preview {
    AddView(selectedDate: Date())
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
                TextField("暗記したい言葉(表)", text: $textFieldFront)
                    .padding(20)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                TextField("暗記したい言葉(裏)", text: $textFieldBack)
                    .padding(20)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                
                HStack {
                    Text("タグ")
                    Spacer()
                    TextField("#", text: $textFieldTag)
                        .padding(8)
                        .frame(width: 115,height: 35)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(6)
                }
                .padding(.top, 10)
                HStack {
                    Text("勉強開始日")
                    Spacer()
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                }
            }
            .padding(30)
            .background(.white)
            .cornerRadius(36)
            .padding(.top, 72)
            .padding(24)
            Button(action: {
                        // ボタンが押された時のアクションをここに書く
                    }) {
                        Text("追加")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
            
            
            Spacer()
        }
        .background(Color("Background"))
        
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
