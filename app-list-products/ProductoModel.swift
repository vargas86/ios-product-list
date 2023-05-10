//
//  ProductoModel.swift
//  app-list-products
//
//  Created by Ivonne on 08/05/23.
//

import Foundation

struct ProductoResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}


// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}


