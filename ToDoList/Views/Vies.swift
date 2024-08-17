//
//  Vies.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 13/08/2024.
//

import SwiftUI

struct Vies: View {
    @AppStorage("number_save") private var number: Int = 0
    
//    @State private var number = UserDefaults.standard.integer(forKey: "num") = 10
    var body: some View {
        VStack{
            GroupBox("hello", content: {
                Text("hello mohammed Alwrafi \(number)")
                Button("button"){
                    number += 1
//                    UserDefaults.standard.set(number, forKey: "num")
                }.buttonStyle(.borderedProminent)
            })
            
            
        }
        
//        .frame(maxWidth: .infinity)
//        .frame(maxHeight: .infinity)
        .padding()
//        .background(Color.black.gradient)
//        .padding()
       

    }
}

#Preview {
    Vies()
}
