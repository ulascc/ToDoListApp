//
//  TaskCell.swift
//  ToDoListApp
//
//  Created by Ulaş Can Çiçek on 27.05.2023.
//

import SwiftUI

struct TaskCell: View
{
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    
    var body: some View {
        
        CheckBoxView(passedTaskItem : TaskItem)
            .environmentObject(dateHolder)
        
        Text(passedTaskItem.name ?? "")
            .padding(.horizontal)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(passedTaskItem: TaskItem())
    }
}
