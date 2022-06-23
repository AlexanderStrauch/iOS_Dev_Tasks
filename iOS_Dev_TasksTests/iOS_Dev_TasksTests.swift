//
//  iOS_Dev_TasksTests.swift
//  iOS_Dev_TasksTests
//
//  Created by Alexander Strauch on 23.06.22.
//

import XCTest
@testable import iOS_Dev_Tasks

class iOS_Dev_TasksTests: XCTestCase {
   
    override func setUpWithError() throws {
        let taskVM = TaskViewModel()
        taskVM.deleteAllEntries()
    }

    override func tearDownWithError() throws {
        let taskVM = TaskViewModel()
        taskVM.deleteAllEntries()
    }

    func AddTaskAndDelete(){
        let taskVM = TaskViewModel()
        
        let task = EntryModel(id:"100000", title: "Unit Test", details: "Unit Test Details", completed: false, creationDate: Date.now)
        
        taskVM.addTask(task: task)
        
        var taskFromVM = taskVM.getTask(id: task.id)
        
        XCTAssertEqual(task.id, taskFromVM.id)
        XCTAssertEqual(task.title, taskFromVM.title)
        XCTAssertEqual(task.creationDate, taskFromVM.creationDate)
        XCTAssertEqual(task.completed, taskFromVM.completed)
        
        
        taskVM.deleteAllEntries()
        
        taskFromVM = taskVM.getTask(id: task.id)
        
        XCTAssertNil(taskFromVM)
    }
    
    func AddTasksAndDeleteCompleted(){
        let taskVM = TaskViewModel()
        
        let task1 = EntryModel(id:"100000", title: "Unit Test 1", details: "Unit Test Details 1", completed: false, creationDate: Date.now)
        taskVM.addTask(task: task1)
        
        let task2 = EntryModel(id:"100001", title: "Unit Test 2", details: "Unit Test Details 2", completed: false, creationDate: Date.now)
        taskVM.addTask(task: task2)
        
        let task3 = EntryModel(id:"100002", title: "Unit Test 3", details: "Unit Test Details 3", completed: true, creationDate: Date.now)
        taskVM.addTask(task: task3)
        
        let tasks = taskVM.getTasks()
        
        XCTAssertEqual(tasks.count, 3)
        
        taskVM.deleteAllCompletedEntries()
        
        XCTAssertEqual(tasks.count, 2)
    }
    
    func AddTaskAndUpdate(){
        let taskVM = TaskViewModel()
                
        let task1 = EntryModel(id:"100010", title: "Unit Test Update", details: "Unit Test Details", completed: false, creationDate: Date.now)
        
        taskVM.addTask(task: task1)
        
        let taskFromVM1 = taskVM.getTask(id: task1.id)
        
        
        let task2 = EntryModel(id:"100010", title: "Unit Test Update", details: "Unit Test Details", completed: true, creationDate: task1.creationDate)
        
        let taskFromVM2 = taskVM.getTask(id: task2.id)
        
        XCTAssertNotEqual(taskFromVM1.completed, taskFromVM2.completed)
        XCTAssertEqual(taskFromVM1.id, taskFromVM2.id)
        XCTAssertEqual(taskFromVM1.title, taskFromVM2.title)
        XCTAssertEqual(taskFromVM1.details, taskFromVM2.details)
    }
}
