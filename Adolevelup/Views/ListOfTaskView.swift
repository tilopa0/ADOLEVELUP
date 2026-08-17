//
//  ListOfTaskView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import SwiftUI

struct ListOfTaskView: View {
    var tasks: [TaskData]

    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    Image("Background1")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .blur(radius: 20)
                }
                //            Color.black.ignoresSafeArea()
                
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(tasks) { task in
                            TaskListRowView(task: task)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Mes missions")
                .toolbar{
                                ToolbarItem(placement: .navigationBarTrailing ) {


                                    NavigationLink {
                                        CompletedTasksView()    //destination
                                    } label: {
                                        Image(systemName: "pencil.and.list.clipboard")
                                            .font(.body)
                                    Text("Tâches Finies")

                                    }


                                }
                            }


                    
                }
            }
        }
    }


#Preview {
    ListOfTaskView(tasks: allTasks)
}
