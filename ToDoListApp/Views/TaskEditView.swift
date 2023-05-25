//
//  TaskEditView.swift
//  ToDoListApp
//
//  Created by Ulaş Can Çiçek on 25.05.2023.
//

import SwiftUI

struct TaskEditView: View {
    
    @State var selectedTaskItem: TaskItem?
    @State var name: String
    @State var desc: String
    @State var dueDate: Date
    @State var scheduleTime: Bool
    
    init(passedTaskItem: TaskItem?, initialDate: Date)
        {
            if let taskItem = passedTaskItem
            {
                _selectedTaskItem = State(initialValue: taskItem)
                _name = State(initialValue: taskItem.name ?? "")
                _desc = State(initialValue: taskItem.desc ?? "")
                _dueDate = State(initialValue: taskItem.dueDate ?? initialDate)
                _scheduleTime = State(initialValue: taskItem.scheduleTime)
            }
            else
            {
                _name = State(initialValue: "")
                _desc = State(initialValue: "")
                _dueDate = State(initialValue: initialDate)
                _scheduleTime = State(initialValue: false)
            }
        }
    
    var body: some View {
        
        Form{
            Section(header: Text("Task")){
                TextField("Task Name", text: $name)
                TextField("Description", text: $desc)
            }
        }
        
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView(passedTaskItem: TaskItem(), initialDate: Date())
    }
}
