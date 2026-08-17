//
//  Ado.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//


import Foundation
import SwiftUI    

struct Ado: Identifiable {
    var id: UUID = UUID()
    var recompense: Int
    // var description: String
    var listTask: [TaskData]
    var motsDoux: [String]
    var photo: String
    var nomAdo: String
    var level: Int
    var xp: Int
}

//var id: Task = Task(nameTask: "Faire les devoirs", color: .brown, descriptionTask: "Accomplire le devoir du jours correctement en autonomie", image: "", isDone: true)

var ados: [Ado] = [
    Ado(
        recompense: 0,
        listTask: [task1, task2, task3, task4, task5, task6, task7, task8, task9, task10, task11, task12, task13, task14, task15, task16, task17
        ],
        motsDoux: [
            
            "Bravo champion",
            "Tu est incroyable, continue comme ça, bien jouer ",
            "Bien jouer tu est sur la bonne direction ",
            "Je suis fier de toi ",
            "Tu est mon Trésor",
            "Tu est courageux",
            "Tu est mon champion aujourd'hui",
            "Bravo ma Rose, tu est sur la bonne voie",
            "La reine du jour ",
            "le roi du jour",
            "Bravo chef",
            "Tu fais de ton mieux et ça se voit",
            "J'adore ton énergie",
            "Tu est capable de tous",
            "Tu progresse chaque jour",
            "J'ai vu ta force",
            "Le héro qui est en toi commence a sortir ",
            
                    ],
        photo: "photoado",
        nomAdo: "Nour",
        level: 0,
        xp: 0
        
    )
]
