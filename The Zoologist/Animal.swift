//
//  Animal.swift
//  The Zoologist
//
//  Created by Tijana Jung on 2/22/23.
//

import UIKit

struct Animal {
    var name: String
    var latinName: String
    var image: UIImage
    var funFacts: [String]
    var sizeRange: [NSDecimalNumber]?
    var sizeUnit: String?
    var weightRange: [NSDecimalNumber]?
    var weightUnit: String?
    var endangeredStatus: String
    var diet: String
}
