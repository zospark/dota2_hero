//
//  Hero.swift
//  ListHero
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation

struct Hero: Codable {
    let id: String
    let name: String
    let portrait: img
    let attack: String
    let roles: [String]
    let primaryAttribs: String
    
    struct img: Codable {
        let full: String
        let vert: String
    }
    
    enum CodingKeys:String,CodingKey {
        case id
        case name
        case portrait
        case attack
        case roles
        case primaryAttribs = "primary_attribs"
    }
}


