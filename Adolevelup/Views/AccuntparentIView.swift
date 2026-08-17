//
//  AccuntparentIView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//
import SwiftUI

struct ParentAccountView: View {
    // 1. Les variables d'état (State) pour les données et l'affichage
    @State private var currentAdo: Ado = ados[0] // Récupère Nour
    @State private var isShowingSheet: Bool = false // Gère la feuille des mots doux
    @State private var textAlertMessage: String = "" // Message de l'alerte
    @State private var showAlert: Bool = false // Gère l'alerte
    
    // 2. Sélection de 3 compétences au hasard
    let parentSkills: [Skill] = Array(skill.shuffled().prefix(3))
    
    // 3. Palette de couleurs pour les icônes de compétences
    let cycleColors: [Color] = [.blue, .purple, .indigo, .pink]
    
    // Fonction simple pour attribuer une icône unique selon le nom de la compétence
    func iconForSkill(_ name: String) -> String {
        switch name.lowercased() {
        case let text where text.contains("rapide"): return "bolt.fill"        // Éclair pour rapidité
        case let text where text.contains("empathie"): return "heart.text.square.fill" // Cœur pour empathie
        case let text where text.contains("écoute"): return "ear.badge.checkmark" // Écoute
        case let text where text.contains("autonomie"): return "person.fill.checkmark" // Autonomie
        case let text where text.contains("respect"): return "hand.thumbsup.fill" // Respect
        default: return "doc.plaintext.fill" // Icône par défaut si besoin
        }
    }
    
    @State private var dailySkills: [Skill] = []
  
    var totalTime: String {
        // variable pour calluler le summ du temps des taches
        var totalTimesTasks: Int {
            Adolevup.allTasks.filter { $0.isDone }.reduce(0) { $0 + $1.tempsTask }
        }
        
        let hours = totalTimesTasks / 60
        let minutes = totalTimesTasks % 60
        
        if hours > 0 {
                return "\(hours)h \(minutes)min"
            } else {
                return "\(minutes)min"
            }
        }
    
    
    //   SKILLS functions pour visualiser l'avancement
                func refreshDailySkills() {
                    if !skill.isEmpty {
                        dailySkills = Array(skill.shuffled().prefix(3))
                    }
                }
    
    
    var body: some View {
        ZStack {
            // --- FOND D'ÉCRAN SÉCURISÉ AVEC BACKGROUND1 ---
            GeometryReader { geometry in
                Image("Background1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 20)
            }
            
            // Filtre sombre pour détacher le texte blanc du fond
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            // --- CONTENU VISIBLE ---
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    
                    // --- EN-TÊTE DE LA PAGE ---
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("ESPACE SUPERVISION")
                              //  .fontWeight(.bold)
                                .foregroundColor(.indigo)
                                .tracking(1.5)
                                .shadow(color: .white.opacity(0.7), radius: 2, x: 2, y: 2)

                            
                            Text("Compte Parent")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                             //   .shadow(color: .white.opacity(0.4), radius: 2)
                                .shadow(color: .indigo.opacity(0.7), radius: 3, x: 3, y: 3)
                        }
                        Spacer()
                        Image(systemName: "person.badge.shield.check.fill")
                            .font(.largeTitle)
                            .foregroundColor(.pink)
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    
                    // --- BANDEAU 1 : MISSIONS EN COURS (Fond Blanc) ---
                    HStack(spacing: 15) {
                        // Icône de cible / objectif pour les missions
                        Image(systemName: "target")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Missions en cours")
                                .font(.headline)
                                .fontWeight(.bold) // Texte mis en gras
                                .foregroundColor(.black)
                            
                            Text("\(currentAdo.listTask.count) tâches au total")
                                .font(.subheadline)
                                .fontWeight(.bold) // Chiffre mis en gras
                                .foregroundColor(.indigo)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    // --- BANDEAU 2 : TEMPS PASSE POUR METRISER LES COMPETENCES (Fond Blanc) ---
                    HStack(spacing: 15) {
                        // Icône de cible / objectif pour les missions
                        Image(systemName: "clock.fill")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Temps passé ")
                                .font(.headline)
                                .fontWeight(.bold) // Texte mis en gras
                                .foregroundColor(.black)
                            
                            Text("\(totalTime)  au total")
                                .font(.subheadline)
                                .fontWeight(.bold) // Chiffre mis en gras
                                .foregroundColor(.indigo)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                    .padding(.horizontal)
                    
                    // --- SECTION : FOCUS COMPÉTENCES ---
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Focus Compétences")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .indigo.opacity(0.7), radius: 3, x: 3, y: 3)

                      //      .shadow(color: .black.opacity(0.4), radius: 2)
                            .padding(.horizontal)
                        
                        //                        // Liste des 3 compétences en bandeaux blancs
                        //                        ForEach(0..<parentSkills.count, id: \.self) { index in
                        //                            let item = parentSkills[index]
                        //                            let itemColor = cycleColors[index % cycleColors.count]
                        //
                        //                            HStack(spacing: 12) {
                        //                                RoundedRectangle(cornerRadius: 2)
                        //                                    .fill(itemColor)
                        //                                    .frame(width: 4, height: 24)
                        //
                        //                                // Icône dynamique et adaptée à chaque mot !
                        //                                Image(systemName: iconForSkill(item.nameSkill))
                        //                                    .font(.title3)
                        //                                    .foregroundColor(itemColor)
                        //
                        //                                Text(item.nameSkill)
                        //                                    .font(.body)
                        //                                    .fontWeight(.bold) // Nom de la compétence mis en gras
                        //                                    .foregroundColor(.black)
                        //
                        //                                Spacer()
                        //
                        //                                Text("\(item.valeur) XP")
                        //                                    .font(.callout)
                        //                                    .fontWeight(.bold) // Score XP mis en gras
                        //                                    .foregroundColor(itemColor)
                        //                            }
                        //                            .padding()
                        //                            .background(Color.white)
                        //                            .cornerRadius(12)
                        //                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        //                        }
                        //                        .padding(.horizontal)
                        //                    }
                     
                        VStack(spacing: 20) {
                            // chager dailySkills
                            ForEach(dailySkills) { item in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(item.nameSkill).font(.subheadline).bold()
                                        Spacer()
                                        Text("\(item.valeur)%").font(.subheadline)
                                    }
                                    
                                    // progress bar
                                    GeometryReader { geo in
                                        ZStack(alignment: .leading) {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.gray.opacity(0.2))
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(item.color) // Цвет из твоего файла данных
                                                .frame(width: geo.size.width * CGFloat(item.valeur) / 100)
                                            // shadow neon
                                                .shadow(color: item.color.opacity(0.4), radius: 2, x: 0, y: 0)
                                                .shadow(color: item.color.opacity(0.3), radius: 3, x: 0, y: 0)
                                                .shadow(color: item.color.opacity(0.4), radius: 3, x: 0, y: 0)
                                        }
                                    }
                                    .frame(height: 10)
                                }
                            }
                        } //end vstack skills
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 3)
                        .padding(.horizontal)

//                        .padding(.horizontal)
                        .onAppear {
                            // changer les skills chque fois
                            refreshDailySkills()
                        }
                        
// --- SECTION : ACTIONS PARENTALES ---
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Actions Parentales")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color: .indigo.opacity(0.7), radius: 3, x: 3, y: 3)
                              //  .shadow(color: .black.opacity(0.4), radius: 2)
                                .padding(.horizontal)
                            
                            
                            
// Bouton Créer Tâche
                            Button(action: {
                                
                                showAlert = true
                            }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                    Text("Créer une nouvelle tâche")
                                        .fontWeight(.bold) // Texte du bouton en gras
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.mint)
                                .cornerRadius(14)
                                .shadow(color: .black.opacity(0.2), radius: 4)
                            }
                            .padding(.horizontal)
                            
// Bouton Mot Doux
                            Button(action: {
                                isShowingSheet.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "heart.fill")
                                    Text("Envoyer un mot doux à \(currentAdo.nomAdo)")
                                        .fontWeight(.bold) // Texte du bouton en gras

                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.purple)
                                .cornerRadius(14)
                                .shadow(color: .black.opacity(0.2), radius: 4)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        
            
// --- FEUILLE MODALE (SHEET) ---
                .sheet(isPresented: $isShowingSheet) {
                    VStack(spacing: 20) {
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 40, height: 5)
                            .padding(.top, 15)
                        
                        Text("Sélectionner un message pour \(currentAdo.nomAdo)")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(currentAdo.motsDoux, id: \.self) { mot in
                                    Button(action: {
                                        textAlertMessage = "Le message « \(mot) » a été envoyé !"
                                        isShowingSheet = false
                                        
                                    }) {
                                        HStack {
                                            Text(mot)
                                                .fontWeight(.medium)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            Image(systemName: "paperplane.fill")
                                                .foregroundColor(.pink)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color(.secondarySystemBackground))
                                        .cornerRadius(12)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            // --- ALERTE ---
                .sheet(isPresented: $showAlert) {
                    AddTaskView()
                }
        }
    }
}
// --- APERÇU ---
#Preview {
    ParentAccountView()
}

