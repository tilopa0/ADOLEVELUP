//
//  AddTaskView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import SwiftUI

struct AddTaskView: View {
    @State private var questName: String = ""
    @State private var questDescription: String = ""
    @State private var selectedSkillIDs: Set<UUID> = []
    @State private var coinsReward: Int = 10
    @State private var xpReward: Int = 50
    
    var isFormValid: Bool {
        !questName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !questDescription.trimmingCharacters(in: .whitespaces).isEmpty
    }
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
               
        ScrollView {
            VStack {
                VStack(spacing: 20) {
                    // Titre
                    Text("Une nouvelle tâche")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .indigo.opacity(0.8), radius: 3, x: 3, y: 3)
                        .textCase(.uppercase)
                        .cornerRadius(15)
                    
                    // Nom de tâche
                    VStack(alignment: .leading) {
                        TextField("Saisissez le nom de la tâche", text: $questName)
                            .tint(.black)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.mint, lineWidth: 0.5))
                            .shadow(color: .indigo.opacity(0.4), radius: 10, x: 0, y: 5) // Тень
                            .padding(.top)
                    }
                    
                    // Поле для описания
                    
                    VStack(alignment: .leading) {
                        ZStack(alignment: .topLeading) {
                            //Текст-подсказка (показывается, пока описание пустое)
                            // Сам TextEditor
                            TextEditor(text: $questDescription)
                                .frame(height: 150)
                                .padding(5)
                                .scrollContentBackground(.hidden) // Важно: скрываем стандартный белый фон TextEditor
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.mint, lineWidth: 0.5))
                                .shadow(color: .indigo.opacity(0.4), radius: 10, x: 0, y: 5)
                            
                            if questDescription.isEmpty {
                                Text("Saisissez la description de la tâche...")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 12)
                            }
                        }
                    }
                }
                .padding()
                
                // ScrollSkills
                Text("Sélectionnez jusqu'à 3 compétences:")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.indigo)
                    .textCase(.uppercase)
                    .shadow(color: .white.opacity(0.2), radius: 20, x: 13, y: 5) // 4. Тень
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(skill) { item in
                            let isSelected = selectedSkillIDs.contains(item.id)
                            
                            
                            Text(item.nameSkill)
                                .shadow(color: .gray.opacity(0.6), radius: 5, x: 0, y: 5) // 4. Тень
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(isSelected ? item.color.opacity(0.1) : Color.white.opacity(0.5))
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(isSelected ? item.color : Color.mint.opacity(0.2), lineWidth: 0.5)
                                )
                            
                            
                            // Добавляем свечение только для выбранного элемента
                                .shadow(color: isSelected ? item.color.opacity(0.6) : .clear, radius: 8, x: 0, y: 0)
                                .animation(.spring(), value: isSelected) // Плавная анимация
                            
                                .onTapGesture {
                                    if selectedSkillIDs.contains(item.id) {
                                        selectedSkillIDs.remove(item.id)
                                    } else if selectedSkillIDs.count < 3 {
                                        selectedSkillIDs.insert(item.id)
                                        
                                        
                                    }//end else if
                                }//end onTapGesture
                        }//end ForEach
                    }//end HStack
                    .padding(.leading)
                }//end ScrollSkills

                
                // Блок наград с интегрированными степперами
                HStack(spacing: 20) {
                    RewardCard(title: "Coins", value: $coinsReward, icon: "star.fill", color: .mint)
                    
                    RewardCard(title: "XP", value: $xpReward, icon: "bolt.fill", color: .purple)
                }
                .padding(.horizontal)
                .padding(.top)
                .shadow(color: .indigo.opacity(0.3), radius: 5, x: 0, y: 3)
                
                
                // Кнопка отправки
                Button(action: {
                    print("Le tâche: \(questName) a ete envoe!")
                    dismiss()
                }) {
                    Text("Ajouter une tâche")
                        .font(.headline)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .textCase(.uppercase)
                        .padding()
                        .background(isFormValid ? Color.indigo.opacity(0.30) : Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.purple, lineWidth: 0.5))
                }
                .disabled(!isFormValid)
                .padding()
                .padding(.top)
                .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 5)
                .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 10)
                
            }
            .frame(maxHeight: .infinity)
            }
        
        //НОВЫЙ ФОН
   //     .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
        .background(
            ZStack {
                Image(ImageResource.background1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 20)

                // Этот слой делает картинку светлее:
                Color.gray.opacity(0.2)
            }
                .ignoresSafeArea()
)
}
}


        // Вспомогательная вью для карточек наград
        struct RewardCard: View {
            let title: String
            @Binding var value: Int // Используем Binding, чтобы менять значение
            let icon: String
            let color: Color
            
            var body: some View {
                    VStack(spacing: 10) {
                        Text(title).font(.title3).bold()
                        
                        HStack(spacing: 10) {
                            Button(action: { if value > 0 { value -= 5 } }) {
                                Image(systemName: "minus.circle.fill").foregroundColor(color).font(.title2)
                            }
                                  .shadow(color: .indigo.opacity(0.3), radius: 3, x: 0, y: 3)
                            
                            Text("\(value)").font(.title2).bold()
                            
                            Button(action: { if value < 1000 { value += 5 } }) {
                                Image(systemName: "plus.circle.fill").foregroundColor(color).font(.title2)
                                    .shadow(color: .indigo.opacity(0.3), radius: 3, x: 0, y: 3)
                            }
                        }
                        
                        Image(systemName: icon)
                            .foregroundColor(.yellow).font(.title2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(color.opacity(0.22))
                    .shadow(color: .indigo.opacity(0.3), radius: 5, x: 0, y: 3)
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(color.opacity(0.7), lineWidth: 0.5))
                    
}
}


#Preview {
    AddTaskView()
}
