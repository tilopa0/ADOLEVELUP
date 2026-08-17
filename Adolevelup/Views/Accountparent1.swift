import SwiftUI

struct CompletedTasksView: View {
    @State private var filtre = "Ce jour"
    
    var body: some View {
        ZStack {
            // ICI : Ton image "Background1" devient le grand fond de l'écran
            Image("Background1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 20)
            
            
            // Le contenu de la page posé par-dessus
            VStack(spacing: 20) {
                Text("Tâches Finies")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Picker("", selection: $filtre) {
                    Text("Ce jour").tag("Ce jour")
                    Text("Cette semaine").tag("Cette semaine")
                    Text("Ce mois").tag("Ce mois")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 10) {
                        if filtre == "Ce jour" {
                           
                            LigneTache(task: task7)
                            LigneTache(task: task1)
                            LigneTache(task: task3)


//                            LigneTache(icone: "drop.fill", iconeCouleur: .cyan, texte: "Prendre sa douche (15 min)")
//                            LigneTache(icone: "fork.knife", iconeCouleur: .orange, texte: "Poser la table (5 min)")
//                            LigneTache(icone: "book.fill", iconeCouleur: .purple, texte: "Faire ses devoirs (45 min)")
                        } else if filtre == "Cette semaine" {
                            LigneTache(task: task2)
                            LigneTache(task: task4)
                            LigneTache(task: task11)
                            LigneTache(task: task1)
                            LigneTache(task: task12)
//                            LigneTache(icone: "house.fill", iconeCouleur: .brown, texte: "Ranger la chambre (30 min)")
//                            LigneTache(icone: "cart.fill", iconeCouleur: .green, texte: "Ranger les courses (15 min)")
                        } else {

                            LigneTache(task: task16)
                            LigneTache(task: task17)
                            LigneTache(task: task8)
//                            LigneTache(icone: "car.fill", iconeCouleur: .blue, texte: "Laver la voiture (1h)")
//                            LigneTache(icone: "face.smiling", iconeCouleur: .pink, texte: "Aider son frère pour ranger les jouets (20 min)")
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

// Composant pour faire les lignes blanches classiques
struct LigneTache: View {
    var task: TaskData

   
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: task.icon)
                .font(.system(size: 20))
                .foregroundColor(task.color)
                .frame(width: 30)
            
            Text(task.nameTask)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
        }
        .padding()
        // Retours au fond blanc uni pour les barres des tâches
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    CompletedTasksView()
}
