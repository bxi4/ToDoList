//
//  AddView.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 12/08/2024.
//

import SwiftUI

struct AddView: View {
    @State var title: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    //Alert
    @State var titleAlert: String = ""
    @State var showAllert: Bool = false
    var body: some View {
        VStack(spacing: 15){
            TextField("Type Somthing here ...", text: $title)
                .font(.headline)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .onSubmit {
                    if listViewModel.checkInTextField(title: title) {
                        listViewModel.addItem(title: title)
                        dismiss()
                    } else {
                        showAllert = true
                    }
                }
//                .padding(.horizontal)
            
            Button(action: {
                if listViewModel.checkInTextField(title: title) {
                    listViewModel.addItem(title: title)
                    dismiss()
                } else {
                    showAllert = true
                }
            }, label: {
                Text("Add Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    
            })
            .alert("Please Enter 4 And more Char!", isPresented: $showAllert , actions: {
                Button("Ok"){}
            })
//            .disabled(!listViewModel.checkInTextField(title: title))
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        
        .navigationTitle("Add Item")
    }
    
    
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
