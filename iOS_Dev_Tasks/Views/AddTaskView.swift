//
//  AddTaskView.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let onSave: (_ task: EntryModel) -> Void
    let id: String = UUID().uuidString
    @StateObject var addTaskVM = AddTaskViewModel()
    
    var body: some View {
        VStack{
                TextField("Title", text: $addTaskVM.title)
                    .padding(15)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .onSubmit{
                        SaveTask()
                    }
            
            TextField("Details", text: $addTaskVM.details)
                .padding(15)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .onSubmit{
                    SaveTask()
                }
            Spacer()
            Button{
                if addTaskVM.isValid(){
                    SaveTask()
                }

            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(.primary)
                    .cornerRadius(10)
            }
        }.padding()
            .navigationTitle("Add Task")
    }
    
    func SaveTask(){
        let task: EntryModel = addTaskVM.getTask(id: id)
        onSave(task)
        presentationMode.wrappedValue.dismiss()
    }
}
