//
//  SwiftDataToDoApp.swift
//  SwiftDataToDo
//
//  Created by Atil Samancioglu on 16.07.2023.
//

import SwiftUI

@main
struct SwiftDataToDoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListScreen()
            }
        }.modelContainer(for: [ToDo.self])
    }
}
