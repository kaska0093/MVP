//
//  Person.swift
//  MVP_002
//
//  Created by Nikita Shestakov on 16.11.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
