//
//  NotItemView.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 17/08/2024.
//

import SwiftUI

struct NotItemView: View {
//    let name: String = Lorem.title
    @State var anmite: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("There Here Not Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("There Not Items For here Page You Want to add items press button under this text Press Now.".capitalized)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Items 😇")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(anmite ? Color.seccondMy : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, anmite ? 30 : 50)
                .scaleEffect(anmite ? 1.1 : 1.0)
                .offset(y: anmite ? -7 : 0 )
                .shadow(
                    color: anmite ? Color.seccondMy.opacity(0.7) :
                        Color.accentColor.opacity(0.7),
                    radius: anmite ? 30 : 10,
                    y: anmite ? 50: 30)

                
            }
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear(perform: addAnmition )
            .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: .infinity)
//        .background(Color.red)
    }
    func addAnmition() {
        guard !anmite else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                anmite.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NotItemView()

            .navigationTitle("title")
    }
}
