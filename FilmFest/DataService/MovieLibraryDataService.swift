//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Janvi Arora on 17/06/24.
//

import Foundation
import UIKit

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {

    var movieManager: MovieManager?

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else { return 0 }

        if section == 0 {
            return movieManager.moviesToSeeCount
        } else if section == 1 {
            return movieManager.moviesSeenCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

}
