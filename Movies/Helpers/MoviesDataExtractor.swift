//
//  MoviesDataExtractor.swift
//  Movies
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import Foundation

class MoviesDataExtractor {
    
    func extractMovieData(response: [String : AnyObject]) -> [Movie] {
        var movies = [Movie]()
        
            let moviesArrayDict = SharedValueExtractor.arrayOfDictionaryValue(response, forKey: "results")
            
            for movieDict in moviesArrayDict {
                let movie = Movie(dictionary: movieDict)
                movies.append(movie)
            }
        
        return movies
    }
}
