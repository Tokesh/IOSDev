//
//  Models.swift
//  IOSFinal
//
//  Created by Yeldos on 25.05.2022.
//

import Foundation


struct Result: Codable{
    let data: [ResultItem]
}

struct ResultItem: Codable{
    let name: String
    let age: Int
    let height: Int
    let proffession: String
}
