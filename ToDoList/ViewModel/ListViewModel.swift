//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 17/08/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var todoArray: [ToDoModelVar] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItem()
    }
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ToDoModelVar].self, from: data)
        else { return }
        
        self.todoArray = savedItem

    }
    
    func deleteItem(indexSet: IndexSet) {
        todoArray.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        todoArray.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        if checkInTextField(title: title) {
            let newItem = ToDoModelVar(title: title, isFinsh: false)
            todoArray.append(newItem)
        }
        
    }
    func checkInTextField(title: String) -> Bool {
        if title.count < 3 {
            return false
        }
            return true
        
    }
    
    func updateItem(item: ToDoModelVar) {
        if let index = todoArray.firstIndex(where: { $0.id == item.id }) {
            todoArray[index] = ToDoModelVar(title: item.title, isFinsh: !item.isFinsh)
        }
    }
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(todoArray) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
    
}
