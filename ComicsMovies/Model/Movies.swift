//
//  Movies.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 16/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import Foundation

// Class permettant de définir la structure et le modèle de donnée
// Que l'on souhaite récupérer dans l'api
// -> Le nom du film
// -> la déscription du film
// -> le tableau de string des url des images.
struct Movies: Decodable {
    
    let name: String
    let description: String!
    let image: [String: String]
}




