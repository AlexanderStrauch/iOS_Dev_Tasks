//
//  TasksView.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import SwiftUI


struct TasksView: View {

    @StateObject var taskListVM = TaskViewModel()
    @State var editingMode: EditMode = .inactive
    
    @State private var showClearAlert = false
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(taskListVM.entryList) {item in
                    TaskRowView(entry: item, onCompletedToggle: {
                        taskListVM.updateTask(task: item.onCompletedToggle())
                    })
                }
                .onDelete(perform: taskListVM.onDelete)
                .onMove(perform: taskListVM.onMove)
            }
        }
        .navigationTitle("Tasks")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing){
                if editingMode == .active {
                    Button("Clear"){
                        print("Clear clicked")
                        showClearAlert = true
                    }.alert("Clear Tasks", isPresented: $showClearAlert){
                        Button("All"){
                            taskListVM.deleteAllEntries()
                            editingMode = .inactive
                        }
                        Button("Completed"){
                            taskListVM.deleteAllCompletedEntries()
                            editingMode = .inactive
                        }
                        } message: {
                            Text("Do you want do delete all tasks, or all completed tasks?")
                    }
                }
                else{
                    NavigationLink(destination: {
                        AddTaskView { task in
                            taskListVM.addTask(task: task)
                        }
                    }, label: {
                        Text("Add")
                    })
                }
            }
        }
        
        .environment(\.editMode, $editingMode)
    }
}
