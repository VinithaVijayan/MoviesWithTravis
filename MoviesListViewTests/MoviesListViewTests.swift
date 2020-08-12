//
//  MoviesListViewTests.swift
//  MoviesListViewTests
//
//  Created by Vinitha Vijayan on 5/27/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesListViewTests: XCTestCase {
    var movieListVC: MovieListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: MovieListViewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewControllerID") as! MovieListViewController
        movieListVC = vc
        _ = movieListVC.view // To call viewDidLoad
    }

    override func tearDown() {
        movieListVC = nil
        super.tearDown()
    }

    func testUpdateDataFunction() {
        let dict1 = ["title" : "Harry Potter1", "overview" : "A hit movie", "poster_path" : "" ]
        let dict2 = ["title" : "Harry Potter2", "overview" : "A hit movie2", "poster_path" : "" ]
        let movie1 = Movie(dictionary: dict1)
        let movie2 = Movie(dictionary: dict2)
        let movies = [movie1, movie2]
        
        movieListVC.updateData(movies: movies)
        
        XCTAssert(movieListVC.movies.count == 2, "UpdateData Function failed")
    }
    
    func testClearDataFunction() {
        let dict1 = ["title" : "Harry Potter1", "overview" : "A hit movie", "poster_path" : "" ]
        let dict2 = ["title" : "Harry Potter2", "overview" : "A hit movie2", "poster_path" : "" ]
        let movie1 = Movie(dictionary: dict1)
        let movie2 = Movie(dictionary: dict2)
        let movies = [movie1, movie2]
        
        movieListVC.movies = movies
        
        movieListVC.clearData()
        
        XCTAssert(movieListVC.movies.count == 0, "ClearData Function failed")
    }
}
