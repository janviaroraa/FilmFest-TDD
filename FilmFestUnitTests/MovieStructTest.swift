//
//  MovieStructTest.swift
//  FilmFestTests
//
//  Created by Janvi Arora on 17/06/24.
//

import XCTest
@testable import FilmFest

final class MovieStructTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMovieStruct() throws {
        let testMovie = Movie(title: "Generic Blockbuster")

        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster", "FAILURE - Movie title was not set as expected!")
    }

    func testMovieStructWithReleaseDate() throws {
        let testMovie = Movie(title: "Generic Blockbuster", releaseDate: "1987")

        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster", "FAILURE - Movie title was not set as expected!")
        XCTAssertEqual(testMovie.releaseDate, "1987" , "FAILURE - Movie release date was not set as expected!")
    }

}
