//
//  ToDoModel.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 12/08/2024.
//

import Foundation

struct ToDoModelVar : Identifiable, Codable {
    let id: String
    let title: String
    var isFinsh: Bool
    
    init(id: String = UUID().uuidString, title: String, isFinsh: Bool) {
        self.id = id
        self.title = title
        self.isFinsh = isFinsh
        
        
    }
    
//    func updateFish() -> ToDoModelVar {
//        return ToDoModelVar(id: id, title: title, isFinsh: !isFinsh)
//        
//    }
}
