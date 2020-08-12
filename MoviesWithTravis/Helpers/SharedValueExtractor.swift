//
//  SharedValueExtractor.swift
//  Movies
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import Foundation

class SharedValueExtractor {
    
    class func arrayOfDictionaryValue(_ values: Dictionary<String, AnyObject>, forKey key: String) -> Array<[String : AnyObject]> {
        
        var v: Array<[String : AnyObject]>
        
        if let value = values[key] as? Array<[String : AnyObject]> {
            v = value
        } else {
            v = []
        }
        
        return v
    }
}
