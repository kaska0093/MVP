//
//  Crypto.swift
//  MVP_001
//
//  Created by Nikita Shestakov on 15.11.2023.
//

import Foundation

struct Crypto {
    var name: String
    var ticket: String
    var value: Int
}

extension Crypto {
    static var testData = [
    Crypto(name: "Bitcoin", ticket: "BTC", value: 5500),
    Crypto(name: "Etherium", ticket: "ETH", value: 230)
    ]
}
