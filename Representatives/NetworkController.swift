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
    
    static func searchRepresentatives(state: String) -> NSURL {
        
        let stringURL = baseURL + state + URLSuffix
        
        return NSURL(string: stringURL)!
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