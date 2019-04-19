//
//  MoviesDetailViewController.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 17/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import UIKit
import Kingfisher

// Class permettant de gérer l'affichage du deuxièle écran lors du clic sur une cellule
// -> Affichage de la donnée description
// -> Affichage de la donnée image.
class MoviesDetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var UiViewDescription: UIWebView!
    
        var currentMovies: Movies!
    
    // Au chargement de l'écran
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = currentMovies.name
        
        // Sinon l'application bug quand UiWebView est vide
        if currentMovies.description == nil {
            UiViewDescription.loadHTMLString("<html><body><h2>Aucune description disponible!</h2><iframe src=\"https://giphy.com/embed/26FPxFeuN8UA7nqGQ\" width=\"480\" height=\"360\" frameBorder=\"0\" class=\"giphy-embed\" allowFullScreen></iframe><p><a href=\"https://giphy.com/gifs/justin-lol-laughing-michael-jordon-26FPxFeuN8UA7nqGQ\"></a></p></body></html><link href=\"https://fonts.googleapis.com/css?family=Marvel\" rel=\"stylesheet\"><style type=\"text/css\" media=\"screen\">h2{color: #fff;text-align:center;}</style>", baseURL: nil)
        }else{
            UiViewDescription.loadHTMLString("<link href=\"https://fonts.googleapis.com/css?family=Marvel\" rel=\"stylesheet\"><style type=\"text/css\" media=\"screen\">html{color: #fff;}a{color:red;}</style>" + currentMovies.description, baseURL: nil)
        }
       
        self.posterImageView.kf.setImage(with: URL(string: currentMovies.image["screen_large_url"]!))
    }
}
