//
//  SampleModel.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import Foundation

// MARK: - Sample
struct Sample: Codable {
    let data: [CellData]?
    let view: [String]?
}

// MARK: - Datum
struct CellData: Codable {
    let name: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int?
    let text: String?
}
