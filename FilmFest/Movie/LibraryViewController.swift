//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by Janvi Arora on 17/06/24.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet weak var dataService: MovieLibraryDataService!

    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
    }


}

