//
//  Skill.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import Foundation
import SwiftUI


struct Skill: Identifiable {
    var id: UUID = UUID()
    var nameSkill: String
    var icon : String
   // var description: String
    var color: Color
    var valeur: Int
    var isExtra: Bool
    var progress : Double
}

var skill1: Skill = Skill(nameSkill: "Empathie",icon:"heart.fill" , color: .pink, valeur: 23, isExtra: false,progress: 0.30)
var skill2: Skill = Skill(nameSkill: "Propreté",icon: "sparkles", color: .mint, valeur: 22, isExtra: false,progress: 0.50)
var skill3: Skill = Skill(nameSkill: "Rapidité",icon: "bolt.fill", color: .yellow, valeur: 18, isExtra: false,progress: 0.40)
var skill4: Skill = Skill(nameSkill: "Assiduité",icon: "book.fill", color: .indigo, valeur: 26, isExtra: true,progress: 0.55)
var skill5: Skill = Skill(nameSkill: "Concentration",icon: "brain.head.profile", color: .orange, valeur: 23, isExtra: false,progress: 0.70)
var skill6: Skill = Skill(nameSkill: "Organisation",icon:"tray.full.fill" , color: .blue, valeur: 40, isExtra: false,progress: 0.65)
var skill7: Skill = Skill(nameSkill: "Bienveillance",icon:"hand.raised.fill" , color: .mint, valeur: 25, isExtra: false,progress: 0.45)
var skill8: Skill = Skill(nameSkill: "Responsabilité",icon:"checkmark.seal.fill" , color: .purple, valeur: 35, isExtra: false,progress: 0.55)
var skill9: Skill = Skill(nameSkill: "Autonomie",icon: "figure.walk" ,color: .green, valeur: 23, isExtra: false,progress: 0.60)
var skill10: Skill = Skill(nameSkill: "Créativité",icon: "paintbrush.fill" ,color: .yellow, valeur: 38, isExtra: false,progress: 0.70)
var skill11: Skill = Skill(nameSkill: "Discipline",icon: "clock.fill" ,color: .orange, valeur: 50, isExtra: false,progress: 0.50)
var skill12: Skill = Skill(nameSkill: "Communication",icon: "bubble.left.and.bubble.right.fill" ,color: .pink, valeur: 32, isExtra: false,progress: 0.60)
var skill13: Skill = Skill(nameSkill: "Flexibilité",icon:"arrow.triangle.2.circlepath" , color: .cyan, valeur: 15, isExtra: false,progress: 0.25)
var skill14: Skill = Skill(nameSkill: "Participation",icon:"person.3.fill" , color: .brown, valeur: 24, isExtra: false,progress: 0.45)
var skill15: Skill = Skill(nameSkill: "Planification",icon: "calendar", color: .teal, valeur: 38, isExtra: false,progress: 0.70)


var skill: [Skill] = [skill1, skill2, skill3, skill4, skill5, skill6, skill7, skill8, skill9, skill10, skill11, skill2, skill3, skill4]






