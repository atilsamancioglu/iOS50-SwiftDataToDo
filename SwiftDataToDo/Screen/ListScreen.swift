//
//  ListScreen.swift
//  SwiftDataToDo
//
//  Created by Atil Samancioglu on 16.07.2023.
//

import SwiftUI

import SwiftUI
import SwiftData

struct ListScreen: View {
    
    @Query(sort: \.name, order: .forward) private var toDos: [ToDo]
    @State private var isAddToDoPresented: Bool = false
    
    var body: some View {
        ToDoListView(toDos: toDos)
            .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add ToDo") {
                    isAddToDoPresented = true
                }
            }
        })
        .sheet(isPresented: $isAddToDoPresented, content: {
            NavigationStack {
                AddToDoScreen()
            }
        })
    }
}

#Preview {
    NavigationStack {
        ListScreen()
            .modelContainer(for: [ToDo.self])
    }
}
