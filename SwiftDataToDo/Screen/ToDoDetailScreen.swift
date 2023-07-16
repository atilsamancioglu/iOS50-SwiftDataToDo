//
//  ToDoDetailScreen.swift
//  SwiftDataToDo
//
//  Created by Atil Samancioglu on 16.07.2023.
//

import SwiftUI
import SwiftData

struct ToDoDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let toDo: ToDo
    
    @State private var name: String = ""
    @State private var priority: Int?
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priority", value: $priority, format: .number)
            Button("Update") {
                guard let priority = priority else { return }
                
                toDo.name = name
                toDo.priority = priority
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                dismiss()
                
            }.buttonStyle(.borderless)
            
        }.onAppear {
            name = toDo.name
            priority = toDo.priority
        }
    }
}

