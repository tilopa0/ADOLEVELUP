//
//  TaskListRowView.swift
//  Adolevup
//
//  Created by apprenant86 on 22/06/2026.
//

import SwiftUI

struct TaskListRowView: View {
    
    var task:TaskData
    @State private var isSelected = false
    
    var body: some View {
        
        HStack{
            
            Button {
                isSelected.toggle()
            }label: {
//                Image (systemName: isSelected ? "checkmark.circle.fill" :"circle")
//                    .font(.title2)
//                    .foregroundStyle(isSelected ? .green: .gray )
            }
            .buttonStyle(.plain)
            NavigationLink {
                TaskdetailView(task: task)
            }label: {
                HStack{
                    Image(systemName: task.icon)
                        .font(.title)
                        .foregroundStyle(task.color)
                    
                    Text(task.nameTask)
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    HStack(spacing:4){
                       
                        Image(systemName: "eurosign.ring.dashed")
                            .foregroundStyle(.purple)
                            .font(.headline)
                        Text("\(task.coins)")
                            .font(.headline)
                            .foregroundStyle(.purple)
                        
                    }
            
                }
                .frame(height: 50)
                .frame(maxWidth:.infinity , alignment:.leading)
                .padding(.vertical , 6)
                .padding(.horizontal)
                .background(
//                    Image(.image10)
//                        .resizable()
//                        .scaledToFill()
//                        .allowsHitTesting(false)
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal ,4)
    }
}

#Preview {
    NavigationStack {
        TaskListRowView(task: task1)
            .padding()
    }
    //   .background(Color.cyan)
}
