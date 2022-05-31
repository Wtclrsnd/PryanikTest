//
//  InhouseModel.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 31.05.2022.
//

import Foundation

struct TextModule {
    let name: String
    let text: String
}

struct ImageModule {
    let name: String
    let imageUrl: String
}

struct SelectorModule {
    let name: String
    let selectedID: Int
    let variants: [Variant]
}
