//
//  Movie.swift
//  FilmFest
//
//  Created by Janvi Arora on 17/06/24.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?

    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

extension Movie: Equatable {
    
}
