//
//  Quiz_DrapeauApp.swift
//  Quiz_Drapeau
//
//  Created by user289221 on 1/27/26.
//

/*
    * Point d'entrée de l'application Quiz_Drapeau, qui initialise l'environnement global pour stocker le score actuel de l'utilisateur et affiche la vue d'accueil du quiz.
    * La classe GlobalData est définie pour stocker le score actuel de l'utilisateur, et est partagée entre les différentes vues du quiz à l'aide de @EnvironmentObject.
    * La vue d'accueil (Homepage) est affichée au lancement de l'application, avec un bouton pour commencer le quiz qui mène à la vue MainView.
*/

import SwiftUI
internal import Combine

/* 
    * Classe pour stocker les données globales de l'application, notamment le score actuel de l'utilisateur. 
    * Cette classe est utilisée pour partager le score entre les différentes vues du quiz, 
    * permettant ainsi de mettre à jour le score en temps réel au fur et à mesure que l'utilisateur répond aux questions.
*/
class GlobalData : ObservableObject {
    @Published var actualScore : Int = 0 // Variable d'état pour stocker le score actuel de l'utilisateur, initialisé à 0
}

@main
struct Quiz_DrapeauApp: App {
    @StateObject var globalState = GlobalData()  // Création d'une instance de GlobalData pour être utilisée comme environnement global dans l'application
    
    var body: some Scene {
        WindowGroup {
            Homepage()                         
                .environmentObject(globalState)            // Affichage de la vue d'accueil du quiz, avec l'environnement global pour le score
        }
    }
}
