//
//  Entry.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import Foundation

struct EntryModel : Identifiable, Encodable, Decodable{
    let id: String
    let title: String
    let details: String
    let completed: Bool
    let creationDate: Date
    var completionDate: Date?
    
    init(id: String = UUID().uuidString, title: String, details: String, completed: Bool, creationDate: Date){
        self.id = id
        self.title = title
        self.details = details
        self.completed = completed
        self.creationDate = creationDate
    }
    
    init(id: String = UUID().uuidString, title: String, details: String, completed: Bool, creationDate: Date, completionDate: Date){
        self.id = id
        self.title = title
        self.details = details
        self.completed = completed
        self.creationDate = creationDate
        self.completionDate = completionDate
    }
    
    func onCompletedToggle() -> EntryModel{
        return EntryModel(id: id, title: title, details: details, completed: !completed, creationDate: creationDate, completionDate: Date.now)
    }
}
