//
//  iOS_Dev_TasksApp.swift
//  iOS_Dev_Tasks
//
//  Created by Alexander Strauch on 18.06.22.
//

import SwiftUI

@main
struct iOS_Dev_TasksApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TasksView()
            }
        }
    }
}
