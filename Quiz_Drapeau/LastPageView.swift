//
//  LastPageView.swift
//  Quiz_Drapeau
//
//  Created by user289221 on 1/27/26.
//

import SwiftUI

/*
 * Vue finale du quiz, affichant le score final de l'utilisateur, un message de feedback en fonction du score, et le meilleur score enregistré. 
 * Elle propose également un bouton pour rejouer le quiz, qui réinitialise le score actuel et met à jour le meilleur score si nécessaire.
 */

struct LastPageView: View {
    @EnvironmentObject var globalState: GlobalData       // Environnement global pour accéder au score actuel de l'utilisateur
    let finalScore: Int                                  // Score final de l'utilisateur, passé en paramètre lors de la création de la vue
    var feedback: ScoreFeedback {                        // Calcul du feedback à afficher en fonction du score final
        let ratio = Double(finalScore) / Double(maxScore)
        
        if ratio <= 1/3 {
            return ScoreFeedback(message: "Pas trop mal 😕", color: .red, size: 25)
        } else if ratio <= 2/3 {
            return ScoreFeedback(message: "Bien joué ! 👍 ", color: .green, size: 25)
        } else {
            return ScoreFeedback(message: "Excellent !!! 👏", color: .blue, size: 30)
        }
    }
    let maxScore: Int
    @AppStorage("bestScore") private var bestScore = 8   // Stockage du meilleur score dans les préférences de l'application
    
    var body: some View {

        ZStack {
            Color(red: 0.3, green: 0.1, blue: 0.7).opacity(0.8)
                .ignoresSafeArea(.all)
            
            VStack {
                // Affichage du score final, du feedback, et du meilleur score
                Spacer()
                Text("LE QUIZ EST TERMINÉ !!")
                    .font(.system(size: 30))
                Text("Ton Score est : \(finalScore) \\ \(maxScore)")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.top, 10)
                Text(feedback.message)
                        .font(.system(size: feedback.size, weight: .bold))
                        .foregroundStyle(feedback.color)
                        .padding(.vertical, 10)
                Text("Le Meilleur Score est : \(max(bestScore, finalScore)) \\ \(maxScore)")
                    .font(.system(size: 28))
                    .padding(.top)
                    .foregroundColor(.yellow.opacity(0.8))
                Spacer().frame(height: 50)
                if(bestScore < finalScore){
                    Text("🎉Felicaitation🥳 \n Tres belle performance")
                        .font(.system(size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(LinearGradient(colors: [.red,.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                }

                // Bouton pour rejouer le quiz, qui réinitialise le score actuel et met à jour le meilleur score si nécessaire
                
                NavigationLink("Rejouer") { 
                    MainView()
                        .onAppear {
    
                            globalState.actualScore = 0

                            if finalScore > bestScore {
                                bestScore = finalScore
                            }
                        }
                }
                .padding(10)
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.green)
                )
                
                Spacer()
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .onAppear {
            
            if finalScore > bestScore {
                bestScore = finalScore // Mise à jour du meilleur score si le score final est supérieur au meilleur score actuel
            }
        }
    }
}

/*
 * Prévisualisation de la vue LastPageView avec un score final de 11 sur 13 pour vérifier l'affichage du feedback et du meilleur score.
 */
#Preview {
    LastPageView(finalScore: 11, maxScore: 13)
        .environmentObject(GlobalData())
}

/* 
 * Structure pour stocker le message de feedback, la couleur et la taille du texte en fonction du score final de l'utilisateur.
 * Elle est utilisée pour personnaliser l'affichage du feedback dans la vue LastPageView.
 */
struct ScoreFeedback {
    let message: String
    let color: Color
    let size: CGFloat
}
