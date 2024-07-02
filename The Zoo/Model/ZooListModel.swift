//
//  ZooListModel.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 15.06.24.
//

import Foundation

struct ZooListModel: Codable {
    let name: String?
    let country: String?
    let image: String?
    let info: String?
    let animals: [Animals]?
}

struct Animals: Codable {
    let name: String?
    let info: String?
}

/*
 
 {
     "name": "Taronga Zoo",
     "country": "Australia",
     "info": "jenijdnwe",
     "animals": [
         {
             "name": "asfwef",
             "info": "wedejwin"
         },
         {
             "name": "asfwef",
             "info": "wedejwin"
         },
         {
             "name": "asfwef",
             "info": "wedejwin"
         }
     ]
 },
 */
