//
//  TaskRowView.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import SwiftUI

struct TaskRowView: View {
    let entry: EntryModel
    let onCompletedToggle: () -> Void
    
    var body: some View {
        HStack{
            NavigationLink(destination: {
                TaskDetailsView(entry: entry)
            }, label: {
                Text(entry.title).strikethrough(entry.completed)
            })
            Spacer()
            Image(systemName: entry.completed ? "checkmark.square" : "square")
                .onTapGesture {
                    onCompletedToggle()
                }
        }
    }
}
