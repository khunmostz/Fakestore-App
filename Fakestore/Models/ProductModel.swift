//
//  ProductModel.swift
//  Fakestore
//
//  Created by Kittabun Sukkasem on 17/3/2567 BE.
//

import Foundation

// MARK: - Product
struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

