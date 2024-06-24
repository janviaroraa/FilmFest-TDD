//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Janvi Arora on 17/06/24.
//

import XCTest
@testable import FilmFest

final class MovieManagerTests: XCTestCase {

    let scifi = Movie(title: "Sci-fi", releaseDate: "1987")
    let adventure = Movie(title: "Adventure/Action")
    let artHouse = Movie(title: "Art House Drama")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initialization

    func testMoviesToSeeInitialCount() {
        let sut = MovieManager()
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }

    func testMoviesSeenInitialCount() {
        let sut = MovieManager()
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }

    func testMoviesToSee() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)

        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }

    func testMovieQueriedAtIndex() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)

        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(scifi.title, movieQueried.title, "FAILURE - Movie queried doesn't match the movie that's present at the index")
    }

    // MARK: Checking Off

    func testCheckOffUpdates() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)

        sut.checkOffMovieAtIndex(0)
        XCTAssertEqual(sut.moviesToSeeCount, 0, "FAILURE - moviesToSeeCount is not updated correctly")
        XCTAssertEqual(sut.moviesSeenCount, 1, "FAILURE - moviesSeenCount is not updated correctly")
        XCTAssertEqual(sut.moviesToSee.count, 0, "FAILURE - Item is not removed from movies to see list")
    }

    func testCheckOffRemoves() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)
        sut.addMovie(movie: adventure)
        sut.addMovie(movie: artHouse)
        sut.checkOffMovieAtIndex(0)

        XCTAssertEqual(sut.moviesToSee[0].title, adventure.title, "FAILURE - Item is not removed from movies to see list and new movie is not updated at index 0")
    }

    func testCheckedOffMovie() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)
        sut.checkOffMovieAtIndex(0)

        let checkedOffMovie = sut.checkedOffMovieAtIndex(0)
        XCTAssertEqual(checkedOffMovie.title, scifi.title, "FAILURE - Item is not added to checked off / seen movies list")
    }

    // MARK: Equaltable

    func testEquatableTitles() {
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Action")

        XCTAssertEqual(movie1.title, movie2.title, "FAILURE - Movies don't match")
    }

    func testNonEquatableTitles() {
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Adventure")

        XCTAssertNotEqual(movie1.title, movie2.title, "FAILURE - Movies match")
    }

    func testEquatableReleaseDates() {
        let movie1 = Movie(title: "Action", releaseDate: "1987")
        let movie2 = Movie(title: "Action", releaseDate: "1987")

        XCTAssertEqual(movie1.releaseDate, movie2.releaseDate, "FAILURE - Movies don't match")
    }

    func testNonEquatableReleaseDates() {
        let movie1 = Movie(title: "Action", releaseDate: "1987")
        let movie2 = Movie(title: "Adventure", releaseDate: "1988")

        XCTAssertNotEqual(movie1.releaseDate, movie2.releaseDate, "FAILURE - Movies match")
    }

    func testClearMoviesArray() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)
        sut.addMovie(movie: adventure)
        
        sut.checkOffMovieAtIndex(0)
        XCTAssertEqual(sut.moviesSeenCount, 1, "FAILURE - moviesSeenCount is not updated correctly")
        XCTAssertEqual(sut.moviesToSeeCount, 1, "FAILURE - moviesToSeeCount is not updated correctly")

        sut.clearAllMovies()
        XCTAssertEqual(sut.moviesSeenCount, 0, "FAILURE - moviesSeenCount is not updated to 0 after all movies are removed")
        XCTAssertEqual(sut.moviesToSeeCount, 0, "FAILURE - moviesToSeeCount is not updated to 0 after all movies are removed")
    }

    // MARK: Duplicates

    func testDuplicateMovies() {
        let sut = MovieManager()
        sut.addMovie(movie: scifi)
        sut.addMovie(movie: scifi)

        XCTAssertEqual(sut.moviesToSeeCount, 1, "FAILURE - Duplicate enteries found")
    }

}
