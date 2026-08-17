//
//  CompteAdoView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import SwiftUI

let ado: Ado = ados[0]
let animatedGradient = LinearGradient(
    colors: [.indigo.opacity(0.7), .purple.opacity(0.6), .blue],
    startPoint: .leading,
    endPoint: .trailing
)

struct CompteAdoView: View {
    @State private var isExpanded: Bool = false
    
    var totalCoins: Int {
        Adolevup.allTasks.filter { $0.isDone }.reduce(0) { $0 + $1.coins }
    }
   
    var totalTimesTasks: Int {
        Adolevup.allTasks.filter { $0.isDone }.reduce(0) { $0 + $1.tempsTask }
    }
    
    
    @State private var dailySkills: [Skill] = []
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                //bloc d'avatar et titre
                HStack{
                    VStack(alignment: .leading) {
                        Text(ado.nomAdo).font(.largeTitle).bold()
                        Text("Salut, explorateur!").font(.title3)
                        Text("LVL \(ado.level)").font(.title).bold()
                        
                    }//end VStack
                    
                    Spacer()
                    Image(ImageResource.heroBoy1)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5) // 4. Тень
                    
                }//end HStack
                .padding(.horizontal)
            
                //progress bar
                VStack{
                    HStack{
                        Text("LVL \(ado.level)")
                            .bold()
                        Spacer()
                        Text("2760 XP")
                            .bold()
                            .font(.title3)
                            .shadow(color: .indigo.opacity(0.3), radius: 4, x: 0, y: 0)
                        Spacer()
                        Text("LVL \(ado.level + 1)")
                            .bold()
                    }//end HStack
                 
                    // progress bar neon
                    ProgressView(value: 0.3)
                        .tint(LinearGradient(colors: [.mint, .purple], startPoint: .leading, endPoint: .trailing))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .padding(.vertical, 5) // Добавляем отступы, чтобы тень не обрезалась
                        // neon cascad
                        .shadow(color: .green.opacity(0.4), radius: 2, x: 0, y: 0)
                        .shadow(color: .purple.opacity(0.4), radius: 2, x: 0, y: 0)
                        .shadow(color: .purple.opacity(0.4), radius: 1, x: 0, y: 0)
                    
                }//end VStack progress bar
                .padding(.horizontal)
                
                
                // --- phrase pour cpourage bloc glissant ---
                VStack(spacing: 0) {
                    // top avec chevron
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(isExpanded ? 180 : 0))
                            .foregroundColor(.gray)
                    }
                    .background(Color.white.opacity(0.8))
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            isExpanded.toggle()
                        }
                    }
                    
                    // text glissant
                    if isExpanded {
                        Text("Ton voyage dans le quartier ADOLÉVAP se poursuit. Aujourd'hui est le jour idéal pour développer tes compétences!")
                            .font(.title3)
                            .italic()
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.6))
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                }
                .cornerRadius(15)
                .padding(.horizontal)
                
                // cartes du progress
                HStack(spacing: 15) {
                    StatCard(title: "Compétences", value: "15", iconName: "star.fill")
                        .shadow(color: .indigo.opacity(0.3), radius: 4, x: 0, y: 2)
                    //    "Temps total consacré à ton réussite"
                    StatCard(title: "Temps de pratique", value:  "\(totalTimesTasks)", iconName: "hourglass.tophalf.filled")
                        .shadow(color: .indigo.opacity(0.3), radius: 4, x: 0, y: 2)
                    StatCard(title: "Tes coins au total", value: "\(totalCoins)", iconName: "dollarsign.circle.fill")
                        .shadow(color: .indigo.opacity(0.3), radius: 4, x: 0, y: 2)
                } //end HStack
                .padding(.horizontal)
                
                
                //выводим сколько заданий на сегодня
                ZStack {
                    TaskBanner(taskCount: Adolevup.allTasks.count)
                } // end ZStack
                
                //SOFT SKILLS FOCUS
                
                Text("FOCUS COMPÉTENCES")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(animatedGradient)
                    .padding(.top, 10)
                    .padding(.leading)
                
                VStack(spacing: 20) {
                    // Используем dailySkills вместо статического списка
                    ForEach(dailySkills) { item in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.nameSkill).font(.subheadline).bold()
                                Spacer()
                                Text("\(item.valeur)%").font(.subheadline)
                            }
                            
                            // Прогресс бар
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                 
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.2))
                                
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(item.color) // Цвет из твоего файла данных
                                       .frame(width: geo.size.width * CGFloat(item.valeur) / 100)
                                    // Слой теней для неона
                                    .shadow(color: item.color.opacity(0.4), radius: 2, x: 0, y: 0)
                                    .shadow(color: item.color.opacity(0.3), radius: 3, x: 0, y: 0)
                                    .shadow(color: item.color.opacity(0.4), radius: 3, x: 0, y: 0)
                                }
                            }
                            .frame(height: 10)
                        }
                    }
                }
                .padding(.horizontal)
                .onAppear {
                    // При каждом заходе на экран навыки будут меняться
                    refreshDailySkills()
                }
                
    
                //des mots doux aléatoires
                if let randomWord = ado.motsDoux.randomElement() {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.purple.opacity(0.1))
                        .frame(height: 80)
                        .overlay(
                            HStack(spacing: 10) {
                                Image(systemName: "heart.fill")
                                    .overlay(
                                        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        
                                            .mask(Image(systemName: "heart.fill"))
                                    )
                                    .font(.title)
                                
                                
                                Text(randomWord)
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5)
                                
                            }//end HStack
                                .padding()
                        )
                }//end if
                //      Spacer(minLength: 80)
                Spacer()
            }//end VStack
            .padding(.vertical)
            
        }//end ScrollView
        .safeAreaPadding(.bottom, 80)
        //     .padding()
        
    }
    
    // ВЫНЕСЛИ ФУНКЦИЮ SKILLS ИЗ BODY 
    func refreshDailySkills() {
        // Проверка, чтобы избежать ошибок, если массив skill пустой
        if !skill.isEmpty {
            dailySkills = Array(skill.shuffled().prefix(3))
        }
    }
    
    // Вспомогательная карточка
    struct StatCard: View{
        let title: String
        let value: String
        let iconName: String
        var body: some View {
            VStack(spacing: 8) {
                Text(title)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                
                HStack(spacing: 5) {
                    Image(systemName: iconName) // Иконка
                        .foregroundColor(.yellow) //Золотистый цвет для монеток
                    Text(value)
                        .bold()
                        .font(.title3)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
          
        }
        
    } //end StatCard: View
    
    
    // Переливающаяся» лента с фото:

    struct TaskBanner: View {
        let taskCount: Int
        @State private var animate = false // Для анимации
        
        var body: some View {
            ZStack {
                // 1. Градиентная подложка
                LinearGradient(colors: [.cyan.opacity(0.8), .purple.opacity(0.5)],  startPoint: .leading, endPoint: .trailing)
                
 // 2. Анимированное фото (например, полупрозрачное)
                Image(ImageResource.background1) // фото
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Растягивает с сохранением пропорций
                    .opacity(0.3)
                    .frame(maxWidth: .infinity, maxHeight: 50) // Занимает всю ширину
                
                // 3. Текст
                Text("\(taskCount) tâches pour aujourd'hui")
                    .bold().foregroundColor(.white)
                    .font(.title)
                    .shadow(color: .indigo.opacity(0.8), radius: 3, x: 3, y: 3)
                
            }
            .frame(height: 50)
            .clipped()
            .cornerRadius(0)
            .onAppear { animate = true }
            .shadow(color: .indigo.opacity(0.6), radius: 4, x: 0, y: 2)
        }
        
    } // end TaskBanner
    
}

#Preview {
    CompteAdoView()
}
