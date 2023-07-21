//
//  OrderClass.swift
//  CupcakeCorner
//
//  Created by Олексій Якимчук on 21.07.2023.
//

import SwiftUI

class OrderClass: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    @Published var order = OrderStruct()

    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(order.type, forKey: .type)
        try container.encode(order.quantity, forKey: .quantity)

        try container.encode(order.extraFrosting, forKey: .extraFrosting)
        try container.encode(order.addSprinkles, forKey: .addSprinkles)

        try container.encode(order.name, forKey: .name)
        try container.encode(order.streetAddress, forKey: .streetAddress)
        try container.encode(order.city, forKey: .city)
        try container.encode(order.zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        order.type = try container.decode(Int.self, forKey: .type)
        order.quantity = try container.decode(Int.self, forKey: .quantity)

        order.extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        order.addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        order.name = try container.decode(String.self, forKey: .name)
        order.streetAddress = try container.decode(String.self, forKey: .streetAddress)
        order.city = try container.decode(String.self, forKey: .city)
        order.zip = try container.decode(String.self, forKey: .zip)
    }
}
