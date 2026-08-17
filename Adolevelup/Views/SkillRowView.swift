//
//  SkillRowView.swift
//  Adolevup
//
//  Created by apprenant86 on 22/06/2026.
//
import SwiftUI

    struct SkillRowView: View {
        var skill: Skill

        var body: some View {
            HStack(spacing: 16) {
                CircularSkillView(
                    icon: skill.icon,
                    label: "",
                    value: skill.valeur,
                    color: skill.color
                )
                .frame(width: 70, height: 70)

                Text(skill.nameSkill)
                    .font(.headline)
                    .foregroundStyle(.black)

                Spacer()
            }
            .padding()
            .background(
    //            Image(.image10)
                  
                
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(skill.color.opacity(0.6), lineWidth: 1.5)
            )
        }
    }

#Preview {
    SkillRowView(skill: skill7)
//        .padding()
//        .background(Color.black)
}
