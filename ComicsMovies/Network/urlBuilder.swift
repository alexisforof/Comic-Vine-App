//
//  urlBuilder.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 16/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import Foundation

// Class permetant de se connecter  à l'api.
class UrlBuilder {
    
    private static let baseUrl: String = {
        
        let isProduction = true
        
        if isProduction {
            // Url de l'api plus fonctionnel, trop de requête ont était envoyé
            //return "https://comicvine.gamespot.com"
            return "https://neopixl.alwaysdata.net/comicvine/movies.json"
        } else {
            // Optionnel dans notre cas, mais sert à pouvoir dissocier les différents
            // url de production -> l'url par exemple ou les developper travaille différent de l'url client
            return "https://dev.comicvine.gamespot.com"
        }
    }()
    
    static let urlMovies: String = {
        
        // La clé d'api à était trop solicité : ban
        //var apiKey:String = "150072d1adb5619a30df8368149d7b9a48c418d0"
        //return "\(baseUrl)/api/movies/?api_key=\(apiKey)&format=json"
        
        return baseUrl
    }()
}
