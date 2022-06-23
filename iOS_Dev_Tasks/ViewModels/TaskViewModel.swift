//
//  TaskViewModel.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject{
    @Published var entryList: [EntryModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let tasksKey: String = "tasks_list"
    
    init(){
        getSavedTasks()
    }
    
    func getSavedTasks(){
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedEntries = try? JSONDecoder().decode([EntryModel].self, from: data)
        else { return }
        
        self.entryList = savedEntries
    }
    
    func getTasks() -> [EntryModel]{
        return entryList
    }
    
    
    func getTask(id: String) -> EntryModel{
        return entryList.first(where: {$0.id == id})!
    }
    
    func onMove(indexSet: IndexSet, to: Int){
        entryList.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func onDelete(indexSet: IndexSet){
        entryList.remove(atOffsets: indexSet)
    }
    
    func updateTask(task: EntryModel){
        if let index = entryList.firstIndex(where: {$0.id == task.id}) {
            entryList[index] = task
        }
    }
    
    func addTask(task: EntryModel){
        if let index = entryList.firstIndex(where: {$0.id == task.id}) {
            entryList[index] = task
            return
        }
        entryList.append(task)
    }
    
    func deleteAllEntries(){
        entryList.removeAll()
    }
    
    func deleteAllCompletedEntries(){
        entryList = entryList.filter(){ $0.completed == false }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(entryList) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
}
