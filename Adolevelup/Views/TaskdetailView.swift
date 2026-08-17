//
//  taskdetailView.swift
//  Adolevup
//
//  Created by apprenant86 on 19/06/2026.
//

import SwiftUI

struct TaskdetailView: View {
    var task: TaskData
    @State private var isCompleted = false
    
    var relatedSkillName: String { "Discipline" }
    var relatedSkillProgress: Double { 50 }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("Background1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 20)
            }
            
            Color.indigo.opacity(0.15)
            
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                CircularSkillView(icon: task.icon, label: relatedSkillName, value: Int(relatedSkillProgress), color: task.color)
                    .frame(width: 230, height: 230)
                
                //                CircularSkillView (
                //                   icon: task.icon,
                //                    label: relatedSkillName,
                //                    percentage: relatedSkillProgress,
                //                   color: task.color
                //                )
                //                .padding(.top, 20)
                
                Text(task.nameTask)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.indigo)
                
                Text(task.descriptionTask)
                    .font(.body)
                    .foregroundStyle(.black.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack(spacing: 8) {
                    
                    HStack{
                        
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundStyle(.yellow)
                                .font(.title)
                            
                            Text("\(task.coins) Coins")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.purple)
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.08))
                        .clipShape(Capsule())
                        
                        HStack {
                            
                            Image(systemName: "bolt.fill")
                                .foregroundStyle(.yellow)
                                .font(.title)
                            
                            Text("  \(task.xp)  XP")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.purple)
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.08))
                        .clipShape(Capsule())
                        
                    }
                  
                    
                    HStack(spacing: 8) {
                        
                        Image(systemName: "clock.badge.checkmark.fill")
                            .foregroundStyle(.yellow)
                            .font(.title)
                        
                        Text("\(task.tempsTask) minuts")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.08))
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    
                    if isCompleted {
//                        Spacer()
                        Image(systemName: "party.popper.fill")
                        //                        .font(.title)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.yellow.opacity(0.80), .indigo)
                            .font(.system(size: 60))
                        Spacer()
                        Text("Bravo ! Tâche terminée ")
                            .font(.title2)
                            .foregroundStyle(.indigo)
                            .padding()
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                    } else {
                        Button {
                            isCompleted = true
                        } label: {
                            Text("Marquer comme terminé")
                                .font(.headline)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(task.color)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
//                .padding(.top, 30)
            }
            .navigationTitle("Détail de la mission")
            .foregroundStyle(.indigo)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
//    NavigationStack {
        TaskdetailView(task: task7)
//    }
}
