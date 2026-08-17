//
//  Task.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import Foundation
import SwiftUI


struct TaskData: Identifiable {
    var id: UUID = UUID()
    var nameTask: String
    var color: Color
    var descriptionTask: String
    var coins: Int
    var icon: String
   // var [SkilLs]
    var isDone: Bool
    var tempsTask : Int
    var xp :Int
}


var task1: TaskData = TaskData(nameTask: "Faire les devoirs", color: .blue, descriptionTask: "Accomplire le devoir du jours correctement en autonomie", coins: 10, icon: "book.fill", isDone: true, tempsTask: 60 ,xp: 70)

var task2: TaskData = TaskData(nameTask: "Ranger ma chambre ", color: .pink, descriptionTask: "Organiser la chambre et remettre chaque objet à sa place. ",  coins: 7, icon: "bed.double.circle", isDone: true, tempsTask: 30 ,xp: 50)

var task3: TaskData = TaskData(nameTask: " Aider à la cuisine", color: .cyan, descriptionTask: "Participer à la préparation du repas ou au rangement de la cuisine.",  coins: 12, icon: "sink.fill", isDone: true, tempsTask: 20 ,xp: 80)

var task4: TaskData = TaskData(nameTask: "Faire du sport", color: .gray, descriptionTask: "Pratiquer une activité physique pour rester en forme et plein d’énergie.",  coins: 20, icon: "figure.run", isDone: true, tempsTask: 15 ,xp: 75)

var task5: TaskData = TaskData(nameTask: " Brosser les dents", color: .purple, descriptionTask: "Se brosser les dents pour garder une bonne hygiène quotidienne.",  coins: 8, icon: "hands.sparkles", isDone: true, tempsTask: 3 ,xp: 66)

var task6: TaskData = TaskData(nameTask: " Passer 1H sans écran", color: .cyan, descriptionTask: "Passer une heure complète sans utiliser d’écran pour se détendre et se concentrer.",  coins: 12, icon: "tv.slash", isDone: true, tempsTask: 60 ,xp: 77)

var task7: TaskData = TaskData(nameTask: "Lire pendant 10 minutes", color: .orange, descriptionTask: "Lire un livre ou une histoire pendant quelques minutes pour développer l’imagination.",  coins: 12, icon: "book.closed.fill", isDone: true, tempsTask: 10 ,xp: 34)

var task8: TaskData = TaskData(nameTask:  "Choisir une tâche libre", color: .pink, descriptionTask: "hoisir une tâche supplémentaire selon l’envie du moment.",  coins: 6, icon: "sparkles", isDone: true, tempsTask: 30 ,xp: 86)

var task9: TaskData = TaskData(nameTask: " Tâche ménagère", color: .cyan, descriptionTask: "Aider dans une petite tâche de la maison pour participer à la vie familiale.",  coins: 10, icon: "house.fill", isDone: true, tempsTask: 15  ,xp: 89)

var task10: TaskData = TaskData(nameTask: "Écrire 3 objectifs pour la journée", color: .brown, descriptionTask: "Écrire trois petits objectifs pour organaiser sa journée.", coins: 9, icon: "list.bullet",  isDone: true, tempsTask:10  ,xp: 58)

var task11: TaskData = TaskData(nameTask: "Écrire sa colère", color: .brown, descriptionTask: "Exprimer sa colère par l’écriture pour mieux gérer ses émotions", coins: 8, icon: "bubble.left.and.bubble.right.fill",  isDone: true, tempsTask: 10 ,xp: 99)

var task12: TaskData = TaskData(nameTask: "Dire un mot gentil", color: .pink, descriptionTask: "Dire quelque chose de gentil à quelqu’un pour encourager la bienveillance.", coins: 10, icon: "heart.fill",  isDone: true, tempsTask: 2 ,xp: 76)

var task13: TaskData = TaskData(nameTask: "Réviser une leçon", color: .cyan, descriptionTask: "Relire et comprendre une leçon pour mieux la retenir.", coins: 12, icon: "book",  isDone: true, tempsTask: 15 ,xp: 49)

var task14: TaskData = TaskData(nameTask: "Préparer le sac de l’école", color: .purple, descriptionTask: "Préparer le sac pour le lendemain afin d’être prêt pour l’école.", coins: 5, icon: "bag.fill",  isDone: true, tempsTask: 5 ,xp: 66)

var task15: TaskData = TaskData(nameTask: "Faire le lit", color: .brown, descriptionTask: "Mettre le lit en ordre pour commencer la journée proprement.", coins: 7, icon: "bed.double.fill",  isDone: true, tempsTask:10 ,xp: 78)

var task16: TaskData = TaskData(nameTask: "Sortir la poubelle", color: .gray, descriptionTask: "contribuer a la propreté de la maison en vidant la poubelle  ", coins: 8, icon: "trash.fill",  isDone: true, tempsTask: 5 ,xp: 95)

var task17: TaskData = TaskData(nameTask: "Apprendre un nouveau mot", color: .yellow, descriptionTask: "Découvrir un noiveau mot pour enrichir la vocabulaire ",coins: 10, icon: "textformat.abc",  isDone: true, tempsTask:10  ,xp: 53)

var allTasks: [TaskData] = [task1, task2, task3, task4, task5, task6, task7, task8, task9, task10, task11, task12, task13, task14, task15, task16, task17]

