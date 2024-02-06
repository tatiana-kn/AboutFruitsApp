//
//  Model.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import Foundation

struct FruitInfo: Decodable {
    let name: String
    let nutritions: Nutritions
    
    init(fruitDetails: [String: Any]) {
        name = fruitDetails["name"] as? String ?? ""
        nutritions = Nutritions(nutritionDetails: fruitDetails["nutritions"] as? [String: Any] ?? [:])
    }
        
    static func getFruits(from value: Any) -> [FruitInfo] {
        guard let fruitsDetails = value as? [[String: Any]] else { return [] }
        return fruitsDetails.map { FruitInfo(fruitDetails: $0) }
    }

    var description: String {
        """
    Name: \(name)
    Calories: \(nutritions.calories)
    Fat: \(nutritions.fat)
    Sugar: \(nutritions.sugar)
    Carbohydrates: \(nutritions.carbohydrates)
    Protein: \(nutritions.protein)
    """
    }
}

struct Nutritions: Decodable {
    let calories: Int
    let fat: Double
    let sugar: Double
    let carbohydrates: Double
    let protein: Double
    
    init(nutritionDetails: [String: Any]) {
        calories = nutritionDetails["calories"] as? Int ?? 0
        fat = nutritionDetails["fat"] as? Double ?? 0
        sugar = nutritionDetails["sugar"] as? Double ?? 0
        carbohydrates = nutritionDetails["carbohydrates"] as? Double ?? 0
        protein = nutritionDetails["protein"] as? Double ?? 0
    }
}

typealias Fruit = [FruitInfo]

enum FruitsAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.fruityvice.com/api/fruit/all")!
        }
    }
}

let fruitImages = [
    "Apple": "🍎",
    "GreenApple": "🍏",
    "Orange": "🍊",
    "Kiwifruit": "🥝",
    "Blueberry": "🫐",
    "Lemon": "🍋",
    "Melon": "🍈",
    "Watermelon": "🍉",
    "Grape": "🍇",
    "Pear": "🍐",
    "Strawberry": "🍓",
    "Tomato": "🍅",
    "Pineapple": "🍍",
    "Mango": "🥭",
    "Banana": "🍌",
    "Avocado": "🥑",
    "Cherry": "🍒",
    "Peach": "🍑"
]



