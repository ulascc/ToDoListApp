//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Ulaş Can Çiçek on 25.05.2023.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment var dateHolder: DateHolder
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var items: FetchedResults<TaskItem>

    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: TaskEditView(passedTaskItem: nil, initialDate: Date())
                                .environmentObject(dateHolder))
                            {
                                Text(item.dueDate!, formatter: itemFormatter)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    FloatingButton()
                        .environmentObject(dateHolder)
                }
            }.navigationTitle("My To Do List")
        }
    }


    func saveContext(_ context: NSManagedObjectContext) {
        do {
            try context.save() 
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
