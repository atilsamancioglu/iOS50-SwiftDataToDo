//
//  ToDoListView.swift
//  SwiftDataToDo
//
//  Created by Atil Samancioglu on 16.07.2023.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    
    let toDos: [ToDo]
    @Environment(\.modelContext) private var context
    
    private func deleteToDo(indexSet: IndexSet) {
        
        indexSet.forEach { index in
            let toDo = toDos[index]
            context.delete(toDo)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
            }.onDelete(perform: deleteToDo)
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
    }
}

#Preview {
    ToDoListView(toDos: [])
        .modelContainer(for: [ToDo.self])
}
