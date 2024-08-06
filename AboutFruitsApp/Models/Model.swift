//
//  Model.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import Foundation

struct Fruit: Codable {
    let name: String
    let nutritions: Nutritions
    let family: String
    let order: String
    let genus: String
    
    var description: String {
        """
    Name: \(name)
    Family: \(family)
    Order: \(order)
    Genus: \(genus)
    Calories: \(nutritions.calories)
    Fat: \(nutritions.fat)
    Sugar: \(nutritions.sugar)
    Carbohydrates: \(nutritions.carbohydrates)
    Protein: \(nutritions.protein)
    """
    }
}

struct Nutritions: Codable {
    let calories: Int
    let fat: Double
    let sugar: Double
    let carbohydrates: Double
    let protein: Double
}




