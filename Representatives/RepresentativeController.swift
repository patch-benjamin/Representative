//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Mike Gilroy on 29/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    
    
    static func searchRepresentatives(state: String, completion: (representativesArray: [Representative]?) ->Void ) {

        let stateURL = NetworkController.searchURL(state)
        
        NetworkController.dataAtURL(stateURL) { (data) -> Void in
            
            guard let data = data else { completion(representativesArray: nil); return }
            
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    
                    if let resultsArray = jsonData["results"] as? [[String: AnyObject]] {
                        
                        var representativesArray: [Representative] = []
                        
                        for rep in resultsArray {
                            if let representative = Representative(jsonDictionary: rep) {
                                representativesArray.append(representative)
                            }
                        }
                        completion(representativesArray: representativesArray)
                        
                        
                    } else {
                        completion(representativesArray: nil)
                    }
                    
                } else {
                    completion(representativesArray: nil)
                }
                
            } catch {
                completion(representativesArray: nil)
            }
        }
    }
}