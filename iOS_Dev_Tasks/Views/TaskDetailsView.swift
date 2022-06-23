//
//  TaskDetailsView.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import SwiftUI


struct TaskDetailsView: View {
    let entry: EntryModel
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    init(entry: EntryModel){
        self.entry = entry
        dateFormatter.dateFormat = "dd.MM.yyyy"
        timeFormatter.dateFormat = "HH:mm"
    }
    
    var body: some View {
        HStack{
            Text("Title")
                .bold()
            Spacer()
            Text(entry.title)
        }
        .padding(10)
        
        HStack{
            Text("Details")
                .bold()
            Spacer()
            Text(entry.details)
        }
        .padding(10)
        
        HStack{
            Text("Completed")
                .bold()
            Spacer()
            Text(entry.completed ? "Yes" : "No")
        }
        .padding(10)
        
        HStack{
            Text("Created on")
                .bold()
            Spacer()
            VStack(alignment: .trailing){
                Text(timeFormatter.string(from: entry.creationDate))
                Text(dateFormatter.string(from: entry.creationDate))
            }
        }.padding(10)
        
        HStack{
            Text("Completed on")
                .bold()
            Spacer()
            if(entry.completed == true){
                VStack(alignment: .trailing){
                    Text(timeFormatter.string(from: entry.completionDate!))
                    Text(dateFormatter.string(from: entry.completionDate!))
                }
            }
        }
        .padding(10)
        Spacer()
    }
}


