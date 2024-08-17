//
//  ListView.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 12/08/2024.
//

import SwiftUI



struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var deleteAll: Bool = false
    var body: some View {
        ZStack{
            if listViewModel.todoArray.isEmpty {
                NotItemView()
            } else {
                List {
                    ForEach(listViewModel.todoArray) { item in
                        ListRowView(title: item.title, isFinsh: item.isFinsh)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                            
                            .swipeActions {
                                Button("Delete"){
                                    deleteItem(item: item)
                                }
                                    .tint(Color.red)
                            }
                    }
                    .onMove(perform: listViewModel.moveItem)
                    .onDelete(perform: listViewModel.deleteItem)
                    
                }
                .listStyle(.grouped)
                
            }
        }
        .navigationTitle("To Do List 📝 ")
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    AddView()
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
                    .disabled(listViewModel.todoArray.isEmpty ? true : false)
                
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Delete All", role: .destructive) {
                    deleteAll = true
                }.disabled(listViewModel.todoArray.isEmpty ? true : false)
                
                .alert("Do you Delete All Items in List ? 🗑️", isPresented: $deleteAll) {
                    Button("Delete", role: .destructive) {
                        listViewModel.todoArray.removeAll()
                    }
                    Button("Cancel", role: .cancel) {
                        
                    }
                }
            }
        }
         
    }
    
    private func deleteItem(item: ToDoModelVar) {
        if let index = listViewModel.todoArray.firstIndex(where: { $0.id == item.id }) {
            listViewModel.todoArray.remove(at: index)
            }
        }
}
#Preview {
    NavigationView {
        ListView()
            
    }
    .environmentObject(ListViewModel())
}


