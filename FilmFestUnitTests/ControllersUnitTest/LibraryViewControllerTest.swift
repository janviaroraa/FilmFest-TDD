//
//  LibraryViewControllerTest.swift
//  FilmFestTests
//
//  Created by Janvi Arora on 17/06/24.
//

import XCTest
@testable import FilmFest

final class LibraryViewControllerTest: XCTestCase {

    var sut: LibraryViewController!

    override func setUp() {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = sut.view
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Nil Checks

    func testTableView() {
        XCTAssertNotNil(sut.libraryTableView, "Library Table View is not instantiated or not found")
    }

    // MARK: Data Source & Delegate

    func testTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource, "Library Table View DataSource is not setup")
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService, "DataSource is not configured with appropriate DataService")
    }

    func testTableViewDDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate, "Library Table View Delegate is not setup")
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService, "Delegate is not configured with appropriate DataService")
    }

    // MARK: Data Service Assumptions

    func testSingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as? MovieLibraryDataService, sut.libraryTableView.delegate as? MovieLibraryDataService, "DataSource & Delegate are not set against same Data Service object")
    }

}
