//
//  ContentView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        TabView {
            
            Tab {
                HomeView()
            }label: {
                Label("Profils",systemImage :"person.2")
                
            }
            Tab {
                ListOfTaskView(tasks: allTasks)
            }label: {
                Label("Tâches",systemImage:"list.star")
                    .foregroundColor(.pink)
                
            }
            
            Tab {
                ListOfSkillsView(skills: skill)
            }label:{
                Label("Compétences",systemImage:"trophy.fill")
                    .foregroundColor(.yellow)
                
                
                
            }
            
        }
        .tint(.rose)
        
    }
    
}

#Preview {
    ContentView()
}
