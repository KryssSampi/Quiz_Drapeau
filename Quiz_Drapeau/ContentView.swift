//
//  ContentView.swift
//  Quiz_Drapeau
//
//  Created by user289221 on 1/27/26.
//

import SwiftUI

/*
    * Vue d'accueil du quiz, affichant un message de bienvenue, un bouton pour commencer le quiz, et le nom du créateur. 
    * Le bouton de navigation mène à la vue MainView qui gère les questions du quiz.
    */

struct Homepage: View {
    var body: some View {
        NavigationStack{
        ZStack {
            // Couleur de fond
            Color(red: 0.3 , green: 0.1 , blue: 0.7).opacity(0.8)
                .ignoresSafeArea(.all)
           
                VStack{
                    Spacer()
                    Text("Bienvenue \n au \n Quiz de Drapeaux")  // Titre du quiz
                        .multilineTextAlignment(.center)
                        .font(.custom("Helvira", size: 40))
                    Spacer().frame(height: 50)
                    
                    NavigationLink("Commencer a jouer"){  // Bouton pour commencer le quiz
                        MainView()
                            .environmentObject(GlobalData())
                    }.foregroundColor(.white)
                        .font(.custom("Helvira", size: 30))
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue)
                                .frame(width: .infinity , height: 60)
                                
                        )
                    Spacer()
                  
                    
                    Text("Made by Kryss Rayane") // Footer avec le nom du créateur
                   
                    
                }
                
            }
        }

   
    }
}

/*
    * Prévisualisation de la vue d'accueil pour vérifier l'affichage du message de bienvenue, du bouton de navigation, et du nom du créateur.
    */

#Preview {
   Homepage()
}
