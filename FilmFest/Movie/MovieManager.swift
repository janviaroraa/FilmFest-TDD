//
//  MovieManager.swift
//  FilmFest
//
//  Created by Janvi Arora on 17/06/24.
//

import Foundation

class MovieManager {

    var moviesToSeeCount: Int {
        return moviesToSee.count
    }

    var moviesSeenCount: Int {
        return moviesCheckedOff.count
    }

    var moviesToSee = [Movie]()
    var moviesCheckedOff = [Movie]()

    func addMovie(movie: Movie) {
        if !moviesToSee.contains(movie) {
            moviesToSee.append(movie)
        }
    }

    func movieAtIndex(index: Int) -> Movie {
        return moviesToSee[index]
    }

    func checkOffMovieAtIndex(_ index: Int) {
        guard index < moviesToSee.count else { return }

        let checkedOffMovie = moviesToSee.remove(at: index)
        moviesCheckedOff.append(checkedOffMovie)
    }

    func checkedOffMovieAtIndex(_ index: Int) -> Movie {
        return moviesCheckedOff[index]
    }

    func clearAllMovies() {
        moviesToSee.removeAll()
        moviesCheckedOff.removeAll()
    }
}
