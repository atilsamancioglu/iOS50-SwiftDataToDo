//
//  AddToDoScreen.swift
//  SwiftDataToDo
//
//  Created by Atil Samancioglu on 16.07.2023.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var name: String = ""
    @State private var priority: Int?
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Priority", value: $priority, format: .number)
        }
        .navigationTitle("Add ToDo")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Dismiss") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    
                    guard let priority = priority else { return }
                    
                    let toDo = ToDo(name: name, priority: priority)
                    context.insert(toDo)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                    
                }.disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
