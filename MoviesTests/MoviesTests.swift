//
//  MoviesTests.swift
//  MoviesTests
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieObjectIntialization() {
        let dict = ["title" : "Harry Potter1", "overview" : "A hit movie", "poster_path" : "" ]
        
        let movie = Movie.init(dictionary: dict)
        
        XCTAssertEqual(movie.overview, dict["overview"], "Movie overview is wrong")
        XCTAssertEqual(movie.title, dict["title"], "Movie title is wrong")
        XCTAssertEqual(movie.poster_path, dict["poster_path"], "Movie poster path is wrong")
    }
    
}
