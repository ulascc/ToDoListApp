//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Ulaş Can Çiçek on 25.05.2023.
//

import SwiftUI

@main
struct ToDoListAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
