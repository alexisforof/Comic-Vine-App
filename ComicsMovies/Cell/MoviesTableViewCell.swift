//
//  MoviesTableViewCell.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 16/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import UIKit
import Kingfisher

// Class permettant d'injecter dans la cellule les données
// -> le nom récupérer sur l'api
// -> l'image récupérer sur l'api.
class MoviesTableViewCell: UITableViewCell {
    
    static let identifier = "moviesCellIdentifier"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var moviesImageView: UIImageView!
    
    
    var movies: Movies! {
        
        // didSet est appelé quand la propriété movies est modifié
        didSet {
            
            self.nameLabel.text = movies.name
            
            self.moviesImageView.kf.setImage(with: URL(string: movies.image["thumb_url"]!))
        }
    }
    
    // Equivalent du viewDidLoad (UIViewController)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
