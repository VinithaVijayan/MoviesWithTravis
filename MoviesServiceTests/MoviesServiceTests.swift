//
//  MoviesServiceTests.swift
//  MoviesServiceTests
//
//  Created by Vinitha Vijayan on 5/27/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import XCTest
@testable import MoviesWithTravis

class MoviesServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchMoviesService() {
        let text = "pepper and the salt sea"
        
         ApiService.sharedInstance.fetchMoviesWith(text: text) { (movies, error) in
            if let err = error {
                XCTFail("Fetch Movies service failed with error: \(err)")
            } else if let moviesList = movies {
                if moviesList.count > 0 {
                        //Suucess
                } else {
                    XCTFail("No movies found")
                }
            }
        }
    }

    func testFetchPosterDownload() {
        let url = URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/lR4drT4VGfts32j9jYTZUc1a3Pa.jpg" )
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let err = error {
                XCTFail("Fetch Movies poster service failed with error: \(err)")
            } else if let data = data {
                if UIImage(data: data) == nil {
                    XCTFail("Fetch Movies poster service failed due to invaild image data")
                }
            }
        }
    }
}
