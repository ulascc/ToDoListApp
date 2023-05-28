//
//  TaskItemExtension.swift
//  ToDoListApp
//
//  Created by Ulaş Can Çiçek on 27.05.2023.
//

import SwiftUI

extension TaskItem
{
    func isCompleted() -> Bool
    {
        return completedDate != nil
    }
    
}
