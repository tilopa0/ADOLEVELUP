//
//  SkillsView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//
import SwiftUI

struct ListOfSkillsView: View {
    var skills: [Skill]

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
         

           
                ScrollView {
                    VStack(spacing: 14) {
                        ForEach(skills) { oneSkill in
                            SkillRowView(skill: oneSkill)
                            
                        }
                    }
                    .padding()
                }
                .navigationTitle("Mes compétences")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .background(Color.clear)
        }
    }
}

#Preview {
    ListOfSkillsView(skills: skill)
}
