//
//  AddTaskViewModel.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import Foundation

class AddTaskViewModel: ObservableObject{
    @Published var title: String = ""
    @Published var details: String = ""
    
    
    func getTask(id: String = UUID().uuidString) -> EntryModel{
        
        return EntryModel(id:id, title: title, details: details, completed: false, creationDate: Date.now)
    }
    
    func isValid() -> Bool{
        if title.isEmpty{
            return false
        }
        
        return true
    }
}
