//
//  Representative.swift
//  Representatives
//
//  Created by Mike Gilroy on 29/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    static let nameKey = "name"
    static let partyKey = "party"
    static let stateKey = "state"
    static let districtKey = "district"
    static let phoneKey = "phone"
    static let officeKey = "office"
    static let linkKey = "link"
    
    var name: String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    
    init?(jsonDictionary: [String: AnyObject]) {
     
        guard let name = jsonDictionary[Representative.nameKey] as? String else { return nil }
        guard let party = jsonDictionary[Representative.partyKey] as? String else { return nil }
        guard let state = jsonDictionary[Representative.stateKey] as? String else { return nil }
        guard let district = jsonDictionary[Representative.districtKey] as? String else { return nil }
        guard let phone = jsonDictionary[Representative.phoneKey] as? String else { return nil }
        guard let office = jsonDictionary[Representative.officeKey] as? String else { return nil }
        guard let link = jsonDictionary[Representative.linkKey] as? String else { return nil }
        
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
}