//
//  ListRowView.swift
//  ToDoList
//
//  Created by Muhammed Ahaj on 12/08/2024.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    @State var isFinsh: Bool
    var body: some View {
        HStack{
            Image(systemName: isFinsh ? "checkmark.circle" : "circle")
                .foregroundColor(isFinsh ? .green: .red)
            Text(title)
                .font(.headline)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(title: "this is first title", isFinsh: false)
}
