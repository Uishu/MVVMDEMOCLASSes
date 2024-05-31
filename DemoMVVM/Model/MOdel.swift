//
//  MOdel.swift
//  DemoMVVM
//
//  Created by Disha on 31/05/24.
//

import Foundation

struct SetCategory: Codable {
    let result: Result
}

struct Result: Codable {
    let index: [Course]
    let collections: Collections
}

struct Course: Codable {
    let id: String
}

struct Collections: Codable {
    let smart: [SmartCollection]
}

struct SmartCollection: Codable {
    let id: String
    let courses: [String]
    var arrCourceData: [Course]?
}

