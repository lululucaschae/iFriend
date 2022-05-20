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
    let friends: [Friend]

    init() {
        id = ""
        name = ""
        company = ""
        email = ""
        address = ""
        about = ""
        registered = ""
        isActive = false
        age = 0
        tags = []
        friends = [Friend(id: "", name: "")]
    }

    

}
