//
//  Movie.swift
//  Movies
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import Foundation

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let upperCasedFirstChar = String(key.first!).uppercased()
        let range = key.startIndex...key.index(key.startIndex, offsetBy: 0)
        let selectorString = key.replacingCharacters(in: range, with: upperCasedFirstChar)
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {
            return
        }
        
        super.setValue(value, forKey: key)
    }
}

class Movie: SafeJsonObject {
    @objc var title: String?
    @objc var overview: String?
    @objc var poster_path: String?

    override init() {
        super.init()
    }
    
    init(dictionary: [String: Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
}
