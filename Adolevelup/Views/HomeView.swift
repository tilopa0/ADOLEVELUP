//
//  HomeView.swift
//  Adolevup
//
//  Created by Apprenant109 on 17/06/2026.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack{
            
        
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
            
            VStack (spacing: 30){
                Text("ADOLEVELUP")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .cyan.opacity(0.8), radius: 3, x: 0, y: 4)


                
                
                NavigationLink(destination: ParentAccountView())
                {
                    ZStack {
                        Image(.PARENT_7)
                            .resizable()
                            .frame(width: 300,height: 300)
                            .cornerRadius(15)
                           .shadow(color: .white.opacity(0.6), radius: 20)
                           .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))


                    }
                }
                NavigationLink(destination: CompteAdoView()) {
                    ZStack {
                        Image(.ADO_6)
                            .resizable()
                            .frame(width: 300,height: 300)
                            .cornerRadius(15)
                            .shadow(color: .white.opacity(0.6), radius: 30)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 1))
            } }
            }
        }
    }
}
}

    
#Preview {
    HomeView()
}
