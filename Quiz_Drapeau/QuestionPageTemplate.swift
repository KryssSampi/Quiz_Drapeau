//
//  QuestionPageTemplate.swift
//  Quiz_Drapeau
//
//  Created by user289221 on 1/27/26.
//


import SwiftUI


/* 
    * Template de la page de chaque question du quiz, affichant le numéro de la question, le score actuel, 
    * l'image du drapeau, les options de réponse, et gérant la logique de navigation vers la question suivante ou la page de fin du quiz.
    * Les éléments clés de cette vue incluent :
    * 1. Affichage de la question actuelle, du score actuel, et de l'image du drapeau correspondant à la question.
    * 2. Affichage des options de réponse sous forme de boutons, avec une alerte indiquant si la réponse est correcte ou incorrecte.
    * 3. Navigation vers la question suivante ou la page de fin du quiz en fonction de si c'est la dernière question ou non.
    * 4. Le bouton de retour est désactivé pour empêcher l'utilisateur de revenir en arrière dans les questions.
*/

struct QuestionPageTemplate: View {


    @State var currentPageNumber: Int = 1                                        // Numéro de la question actuelle
    @State var pagesCount: Int = 13                                              // Nombre total de questions dans le quiz
    @Binding var currentScore: Int                                               // Score actuel de l'utilisateur, lié à une variable d'état dans la vue parent
    @State var showAlert = false                                                 // Variable d'état pour contrôler l'affichage de l'alerte de réponse correcte/incorrecte
    @State var currentAnswer = ""                                                // Variable d'état pour stocker la réponse sélectionnée par l'utilisateur
    @State var correctAnswer: String = "Ontario"                                 // Réponse correcte pour la question actuelle, qui sera passée en paramètre lors de la création de la vue
    @State var currentPageFlag: String = "Ontario"                               // Nom de l'image du drapeau correspondant à la question actuelle, qui sera passée en paramètre lors de la création de la vue
    @State var propositions: [String] = ["Manitoba" , "Ontario" , "Terre-Neuve"] // Options de réponse pour la question actuelle, qui seront passées en paramètre lors de la création de la vue
    



    /*
        * La logique de navigation est gérée dans l'alerte qui s'affiche lorsque l'utilisateur sélectionne une réponse.
         Si c'est la dernière question, le bouton "Suivant" navigue vers la page de fin du quiz.
          Sinon, il navigue vers la question suivante en créant une nouvelle instance de QuestionPageTemplate avec les données de la question suivante.
        */

    let questionIndex: Int
    let allQuestions: [Question]
    
    var isLastQuestion: Bool {
        questionIndex >= allQuestions.count - 1
    }
    
    var body: some View {
        ZStack {

            /* 
                * La vue est structurée avec une ZStack pour superposer les éléments, avec une couleur de fond et une VStack pour organiser les éléments verticalement.
                * Les options de réponse sont affichées dans une boucle ForEach, avec des boutons stylisés pour chaque option.
                * L'alerte affiche un message différent en fonction de si la réponse sélectionnée est correcte ou incorrecte, 
                 et propose un bouton "Suivant" pour naviguer vers la question suivante ou la page de fin du quiz.
                * Le bouton de retour est désactivé pour empêcher l'utilisateur de revenir en arrière dans les questions.
                */

            Color(red: 0.3, green: 0.1, blue: 0.7).opacity(0.8).ignoresSafeArea()
            
            VStack {
                Text("Question \(currentPageNumber) \\ \(pagesCount)")      // Affichage du numéro de la question actuelle et du nombre total de questions
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                Spacer()
                Text("Score actuel : \(currentScore)")
                    .font(.system(size: 30))
                Image(currentPageFlag)                                      // Affichage de l'image du drapeau correspondant à la question actuelle
                    .resizable()
                    .padding(10)
                    .border(.blue)
                    .frame(width: .infinity, height: 200)
                Spacer().frame(height: 50)
                
                ForEach(propositions, id: \.self) { P in                    // Affichage des options de réponse sous forme de boutons
                    Button {
                        currentAnswer = P
                        if currentAnswer == correctAnswer {
                            currentScore += 1
                        }
                        showAlert = true
                    } label: {
                        RoundedRectangle(cornerRadius: 20)                 // Style du bouton de chaque option de réponse
                            .fill(.blue.opacity(0))
                            .stroke(.green, lineWidth: 2)
                            .blur(radius: 2)
                            .shadow(color: .white, radius: 10)
                            .padding(.horizontal, 20)
                            .frame(width: .infinity, height: 80)
                            .overlay(
                                Text(P)
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            )
                    }
                    .alert("", isPresented: $showAlert) {                  // Alerte affichée lorsque l'utilisateur sélectionne une réponse, indiquant si la réponse est correcte ou incorrecte
                        if isLastQuestion {
                            NavigationLink("Suivant") {
                                LastPageView(finalScore: currentScore, maxScore: pagesCount)
                            }
                        } else {
                            NavigationLink("Suivant") {

                                    // Navigation vers la question suivante en créant une nouvelle instance
                                    // de QuestionPageTemplate avec les données de la question suivante

                                let nextIndex = questionIndex + 1
                                let nextQuestion = allQuestions[nextIndex]
                                QuestionPageTemplate(
                                    currentPageNumber: nextIndex + 1,
                                    pagesCount: pagesCount,
                                    currentScore: $currentScore,
                                    correctAnswer: nextQuestion.correctAnswer,
                                    currentPageFlag: nextQuestion.province,
                                    propositions: nextQuestion.options,
                                    questionIndex: nextIndex,
                                    allQuestions: allQuestions
                                )
                            }
                        }
                    } message: {
                        Text(currentAnswer == correctAnswer ? "Bonne réponse 🎉" : "Mauvaise Réponse ❌") 
                    }
                    
                    Spacer().frame(height: 20)
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Prévisualisation de la vue QuestionPageTemplate avec des données de test pour vérifier l'affichage et la logique de navigation.

#Preview {
    QuestionPageTemplate(
        currentPageNumber: 1,
        pagesCount: 13,
        currentScore: .constant(0),
        correctAnswer: "Ontario",
        currentPageFlag: "Ontario",
        propositions: ["Manitoba", "Ontario", "Terre-Neuve"],
        questionIndex: 0,
        allQuestions: Questions().questions
    )
}
