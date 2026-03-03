// Question.swift
// TestExam
//
// Created by Mathieu Robson on 2025-05-23.
// Copyright © 2025 Mathieu Robson. All rights reserved.

/*
    * Ce fichier définit la structure de données pour les questions du quiz, avec une struct Question qui contient le nom de la province, les options de réponse, et la réponse correcte.
    * La classe Questions contient une liste de questions préremplies pour le quiz,
    * qui seront utilisées dans la vue MainView pour afficher les questions au fur et à mesure que l'utilisateur progresse dans le quiz.
*/

import SwiftUI
internal import Combine

/* 
    * Structure pour représenter une question du quiz, avec le nom de la province, les options de réponse, et la réponse correcte.
    * Cette struct est utilisée pour stocker les données de chaque question dans la classe Questions.
*/
struct Question {
    let province: String
    let options: [String]
    let correctAnswer: String
}

class Questions {
    /*
        * Classe pour stocker la liste des questions du quiz, avec une variable d'état @Published pour permettre la mise à jour de l'interface utilisateur lorsque les questions sont modifiées.
        * La liste des questions est préremplie avec les données des provinces canadiennes, leurs options de réponse, et leurs réponses correctes.
    */
    @Published var questions: [Question] = [
        Question(province: "Alberta", options: ["Manitoba", "Alberta", "Yukon"], correctAnswer: "Alberta"),
        Question(province: "Colombie-Britannique", options: ["Colombie-Britannique", "Manitoba", "Terre-Neuve"], correctAnswer: "Colombie-Britannique"),
        Question(province: "Ile-du-Prince-Edouard", options: ["L'Ile-du-Prince-Édouard", "Nouvelle-Écosse", "Nunavut"], correctAnswer: "L'Ile-du-Prince-Édouard"),
        Question(province: "Manitoba", options: ["Nouveau-Brunswick", "Saskatchewan", "Manitoba"], correctAnswer: "Manitoba"),
        Question(province: "Nouveau-Brunswick", options: ["Ontario", "Nouveau-Brunswick", "Québec"], correctAnswer: "Nouveau-Brunswick"),
        Question(province: "Nouvelle-Ecosse", options: ["Territoire du Nord-Ouest", "Yukon", "Nouvelle-Écosse"], correctAnswer: "Nouvelle-Écosse"),
        Question(province: "Nunavut", options: ["Nunavut", "Ontario", "Québec"], correctAnswer: "Nunavut"),
        Question(province: "Ontario", options: ["Ontario", "Manitoba", "Terre-Neuve"], correctAnswer: "Ontario"),
        Question(province: "Quebec", options: ["Colombie-Britannique", "Québec", "L'Ile-du-Prince-Édouard"], correctAnswer: "Québec"),
        Question(province: "Saskatchewan", options: ["Nouveau-Brunswick", "Terre-Neuve", "Saskatchewan"], correctAnswer: "Saskatchewan"),
        Question(province: "Terre-Neuve", options: ["Territoire du Nord-Ouest", "Terre-Neuve", "Yukon"], correctAnswer: "Terre-Neuve"),
        Question(province: "Territoire du Nord-Ouest", options: ["Alberta", "Territoire du Nord-Ouest", "Québec"], correctAnswer: "Territoire du Nord-Ouest"),
        Question(province: "Yukon", options: ["L'Ile-du-Prince-Édouard", "Yukon", "Colombie-Britannique"], correctAnswer: "Yukon")
    ]
}
