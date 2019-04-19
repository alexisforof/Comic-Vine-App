//
//  MoviesService.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 16/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import Foundation
import Alamofire

// Class permettant d'envoyer une requête à l'api avec Alamofire
// La réponse de la requette nous renvoie sois :
// -> le résultats des données de la requêtes
// -> L'erreur de la requête
class MoviesService {
    
    typealias SuccessMovies = (_ movies: [Movies]) -> Void
    typealias Failure = (_ error: Error) -> Void
    
    
    static func retrieveMovies(success: @escaping SuccessMovies, failure: @escaping  Failure) {
        
        // On stock dans la variable url
        // La connexion à l'api afin d'envoyer une requête plus tard dans le code
        let url = UrlBuilder.urlMovies
       
        // Envoi de la requête
        AF.request(url)
            // récupération de la réponse avec parsing automatique
            .responseDecodable() {
                (response: DataResponse<MoviesResult>) in
                
                
                // Success / error
                switch response.result {
                    
                case .success(let value):
                    
                    let results = value.results
                    
                    success(results)
                    print(results)
                    
                    
                case .failure(let error):
                    print("error:\(error)")
                    
                    failure(error)
                }
            }
        }
    }
