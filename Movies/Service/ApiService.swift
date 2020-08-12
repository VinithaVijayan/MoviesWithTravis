//
//  ApiService.swift
//  Movies
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import Foundation

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    
    func fetchMoviesWith(text: String, completion: @escaping (_ movies: [Movie]?, _ error: Error?) -> ()) {                    
        if let urlString = (kBaseurl + text).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) , let url = URL(string: urlString ) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    completion(nil, err)
                } else {
                    do {
                        if let unwrappedData = data, let jsonDicts = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [String: AnyObject] {
                            let albums = MoviesDataExtractor().extractMovieData(response: jsonDicts)
                            DispatchQueue.main.async {
                                completion(albums, nil)
                            }
                        }
                    } catch _ {
                        print("error")
                    }
                }
                }.resume()
        } else {
            completion(nil, nil)
        }
    }
}
