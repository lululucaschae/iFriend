//
//  Friend.swift
//  iFriend
//
//  Created by Lucas Chae on 5/18/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id, name, company, email, address, about, registered: String
    let isActive: Bool
    let age: Int
    let tags: [String]
    
    
    struct Friends {
        let id: String
        let name: String
    }
}
