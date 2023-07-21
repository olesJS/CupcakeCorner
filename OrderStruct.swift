//
//  OrderStruct.swift
//  CupcakeCorner
//
//  Created by Олексій Якимчук on 21.07.2023.
//

import Foundation

struct OrderStruct {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type: Int = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    // Delivery Details
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    // Address Validation
    var hasValidAddress: Bool {
        if name.replacingOccurrences(of: " ", with: "") == "" || streetAddress.replacingOccurrences(of: " ", with: "") == ""  || city.replacingOccurrences(of: " ", with: "") == "" || zip.replacingOccurrences(of: " ", with: "") == "" {
            return false
        }
        
        if zip.replacingOccurrences(of: " ", with: "").count != 5 { return false }
        
        for char in name {
            if char.isNumber { return false }
        }
        
        for char in city {
            if char.isNumber { return false }
        }
        
        for num in zip {
            if num.isLetter { return false }
        }
        
        for char in streetAddress {
            if Int(String(char)) != nil { return true }
        }
        
        return true
    }
    
    // Price
    var cost: Double {
        var cost = Double(quantity) * 2

        cost += (Double(type) / 2)

        if extraFrosting { cost += Double(quantity) }

        if addSprinkles { cost += Double(quantity) * 0.5 }
        
        return cost
    }
}
