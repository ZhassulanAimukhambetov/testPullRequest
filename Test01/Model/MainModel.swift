//
//  MainModel.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import Foundation

struct MainModel: Decodable {
    let id: String
    let index: Int
    let guid: String
    let isActive: Bool
    let balance: String
    let picture: String
    let age: Int
    let eyeColor, name, gender, company: String
    let email, phone, address, about: String
    let registered: String
    let latitude, longitude: Double
    let tags: [String]
    let friends: [Friend]
    let greeting, favoriteFruit: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case index, guid, isActive, balance, picture, age, eyeColor, name, gender, company, email, phone, address, about, registered, latitude, longitude, tags, friends, greeting, favoriteFruit
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.index = try container.decode(Int.self, forKey: .index)
        self.guid = try container.decode(String.self, forKey: .guid)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.balance = try container.decode(String.self, forKey: .balance)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.age = try container.decode(Int.self, forKey: .age)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.name = try container.decode(String.self, forKey: .name)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(String.self, forKey: .registered)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
        self.greeting = try container.decode(String.self, forKey: .greeting)
        self.favoriteFruit = try container.decode(String.self, forKey: .favoriteFruit)
    }
}

struct Friend: Decodable {
    let id: Int
    let name: String
}
