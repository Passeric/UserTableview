//
//  Struct.swift
//  UserTableview
//
//  
//

import Foundation
import UIKit

class User: Codable {
    let user: [UserDetails]

    enum CodingKeys: String, CodingKey {
        case user = "User"
    }
    init(user: [UserDetails]) {
        self.user = user
    }
}

class UserDetails: Codable {
    let name: String
    let age: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case age = "Age"
    }

    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
