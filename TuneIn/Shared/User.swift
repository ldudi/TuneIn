//
//  User.swift
//  TuneIn
//
//  Created by Labhesh Dudi on 11/05/26.
//

import Foundation

// MARK: - UserArray
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let ip: String
    let macAddress, university: String
    let ein, ssn, userAgent: String
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Nick",
            lastName: "Sarno",
            maidenName: "",
            age: 76,
            email: "hi@hi.com",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: Constants.randomImage,
            bloodGroup: "",
            height: 180,
            weight: 200,
            eyeColor: "",
            ip: "",
            macAddress: "",
            university: "",
            ein: "",
            ssn: "",
            userAgent: ""
        )
    }
}
