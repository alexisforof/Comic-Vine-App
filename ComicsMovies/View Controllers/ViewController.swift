//
//  ViewController.swift
//  ComicsMovies
//
//  Created by Ouarab Alexis on 16/04/2019.
//  Copyright © 2019 Ouarab&co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var movies = [Movies]()
    lazy var allMovies = [Movies]()
    
    // Segue permettant le passage de donnée.
    // D'un écran à un autre.
    let detailMoviesIdentifier = "segue_detail_identifier"
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    // Au chargement de l'ecran
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MoviesService.retrieveMovies(success: { (movies) in
            
            // Stockage des movies dans mon tableau global
            self.movies.removeAll()
            self.movies.append(contentsOf: movies)
            
            // On stocke aussi tous les movies dans un autre tableau qu'on ne filtrera pas
            self.allMovies.removeAll()
            self.allMovies.append(contentsOf: movies)
            
            // On ordonne au tableView de se recharger
            self.movieTableView.reloadData()
            
            
            self.loadingView.isHidden = true
            
        }) { (error) in
        }
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Comment savoir ou l'on va  ? Vers quel écran ?
        // grâce à l'identifiant du segue
        if segue.identifier == detailMoviesIdentifier {
            
            let detailViewController = segue.destination as! MoviesDetailViewController
            
            // sender = élément graphique qui a déclenché le segue
            // cell = sender sous forme de EpisideTableViewCell
            // => accès direct à la cellule
            if let cell = sender as? MoviesTableViewCell {
                
                let movies = cell.movies
                
                detailViewController.currentMovies = movies
            }
        }
    }
}

// Dans cette partie du code
// on rajoute les méthodes à notre ViewController
// pour qu'il puisse assurer le rôle de Datasource auprès
// de la TableView (nombre cellules + les cellules)
extension ViewController: UITableViewDataSource {
    
    // méthode appelée par la TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // méthode appelée par la TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Récupérer une cellule du cache
        // ou en générer une nouvelle
        // IndexPath = 2 valeurs
        // Section - row
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as!
        MoviesTableViewCell
        
        //cast de UITableViewCell en EpisodeTableViewCell
        cell.movies = movies[indexPath.row]
        
        return cell
    }
    
    
}

// Méthode permettant de créer un filtre pour la bare de recherche
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.movies = allMovies
        } else {
            self.movies = allMovies.filter({ (movies) -> Bool in
                // true = conserve l'épisode (fera donc parti du tableau filtré)
                // false = ne conserve pas l'épisode
                return movies.name.lowercased().contains(searchText.lowercased())
            })
        }
        
        // On rafraichit la TableView
        
        self.movieTableView.reloadData()
        
    }
}


