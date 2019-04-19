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
            return "https://comicvine.gamespot.com"
        } else {
            // Optionnel dans notre cas, mais sert à pouvoir dissocier les différents
            // url de production -> l'url par exemple ou les developper travaille différent de l'url client
            return "https://dev.comicvine.gamespot.com"
        }
    }()
    
    static let urlMovies: String = {
        
        
        var apiKey:String = "Your Api"
        return "\(baseUrl)/api/movies/?api_key=\(apiKey)&format=json"
        
    }()
}
