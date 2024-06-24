//
//  DataServiceUnitTest.swift
//  FilmFestTests
//
//  Created by Janvi Arora on 17/06/24.
//

import XCTest
@testable import FilmFest

final class DataServiceUnitTest: XCTestCase {

    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!

    let movie1 = Movie(title: "Action")
    let movie2 = Movie(title: "Fairy Tale")
    let movie3 = Movie(title: "Adventure")

    override func setUp() {
        super.setUp()
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        libraryTableView = UITableView()
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections

    func testTableViewSections() {
        XCTAssertEqual(libraryTableView.numberOfSections, 2, "Number of sections doesn't come out to be 2")
    }

    func testTableViewSection1() {
        sut.movieManager?.addMovie(movie: movie1)
        sut.movieManager?.addMovie(movie: movie2)

        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2, "Number of rows doesn't come out correct")

        sut.movieManager?.addMovie(movie: movie3)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3, "Number of rows doesn't come out correct")

    }

    func testTableViewSection2() {
        sut.movieManager?.addMovie(movie: movie1)
        sut.movieManager?.addMovie(movie: movie2)
        sut.movieManager?.addMovie(movie: movie3)

        sut.movieManager?.checkOffMovieAtIndex(0)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1, "Number of rows doesn't come out correct")

        sut.movieManager?.checkOffMovieAtIndex(0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2, "Number of rows doesn't come out correct")
    }

}
