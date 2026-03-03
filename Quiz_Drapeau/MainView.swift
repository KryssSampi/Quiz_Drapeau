//
//  MainView.swift
//  Quiz_Drapeau
//
//  Created by user289221 on 1/27/26.
//

import SwiftUI

/*
 * Vue principale du quiz, qui initialise la navigation vers les questions en utilisant la vue QuestionPageTemplate.
 *Elle utilise un environnement global pour stocker le score actuel de l'utilisateur et passe les données de la première question à la vue QuestionPageTemplate.
 */
 
struct MainView: View {

    @EnvironmentObject var globalState: GlobalData  // Environnement global pour stocker le score actuel de l'utilisateur
    let questions = Questions().questions           // Récupération des questions du quiz à partir d'une instance de la classe Questions
    
    var body: some View {

        NavigationStack { // NavigationStack pour gérer la navigation entre les différentes vues du quiz
            if !questions.isEmpty {
                QuestionPageTemplate(
                    currentPageNumber: 1,
                    pagesCount: questions.count,
                    currentScore: $globalState.actualScore,
                    correctAnswer: questions[0].correctAnswer,
                    currentPageFlag: questions[0].province,
                    propositions: questions[0].options,
                    questionIndex: 0,
                    allQuestions: questions
                )
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(GlobalData())
}
