//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Mike Gilroy on 29/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let sharedInstance = RepresentativeController()
    
    var representativesArray: [Representative] = []
    
    func searchRepresentatives(state: String, completion: (representativesArray: [Representative]?) ->Void ) {
        
        let stateURL = NetworkController.searchURL(state)
        
        NetworkController.dataAtURL(stateURL) { (data) -> Void in
            
            guard let data = data else { completion(representativesArray: nil); return }
            
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    
                    if let resultsArray = jsonData["results"] as? [[String: AnyObject]] {
                        
                        for rep in resultsArray {
                            if let representative = Representative(jsonDictionary: rep) {
                                self.representativesArray.append(representative)
                            }
                        }
                        completion(representativesArray: self.representativesArray)
                        
                        
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