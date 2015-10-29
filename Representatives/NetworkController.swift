//
//  NetworkController.swift
//  Representatives
//
//  Created by Mike Gilroy on 29/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    

    static let baseURL = "http://whoismyrepresentative.com/getall_reps_bystate.php?state="
    static let URLSuffix = "&output=json"
    
    static func searchURL(state: String) -> NSURL {
        
        let stringURL = baseURL + state + URLSuffix
        
        return NSURL(string: stringURL)!
    }
    
    static func showAll(completion: (data: NSData?) -> Void) {
        
        let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

        for state in states {
            let url = searchURL(state)
            dataAtURL(url, completion: { (data) -> Void in
                completion(data: data)
            })
        }
    }
    
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            if let _ = error {
                completion(data: nil)
                print("error getting dataTask")
                return
            }
            
            if let data = data {
                
                completion(data: data)
                
            } else {
                completion(data: nil)
                print("error getting data")
                return
            }
        }
        dataTask.resume()
    }
    
}