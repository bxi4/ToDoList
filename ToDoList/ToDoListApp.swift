//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 12/08/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
