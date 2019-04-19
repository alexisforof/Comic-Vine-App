//
//  MoviesResult.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 16/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import Foundation

// Classe permettant de stocker le résultat des film de type film dans un tableau.
struct MoviesResult: Decodable {
    
    let results: [Movies]
}
