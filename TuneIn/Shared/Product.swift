//
//  Product.swift
//  TuneIn
//
//  Created by Labhesh Dudi on 11/05/26.
//

import Foundation

// MARK: - ProductArray
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
//    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: String
//    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
//    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Example product title",
            description: "This is some mock product description that goes here",
            category: "Electronic Devices",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            tags: ["value"],
            brand: "Apple",
            sku: "sku-123",
            weight: 123,
            warrantyInformation: "value",
            shippingInformation: "value",
            availabilityStatus: "value",
            returnPolicy: "value",
            minimumOrderQuantity: 321,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
