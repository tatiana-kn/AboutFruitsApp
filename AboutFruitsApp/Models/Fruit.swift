//
//  Model.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import Foundation

typealias Fruit = [FruitInfo]

struct FruitInfo: Decodable {
    let name: String
    let nutritions: Nutritions
    
    init(fruitDetails: [String: Any]) {
        name = fruitDetails["name"] as? String ?? ""
        nutritions = Nutritions(nutritionDetails: fruitDetails["nutritions"] as? [String: Any] ?? [:])
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
    
    static func getFruits(from value: Any) -> [FruitInfo] {
        guard let fruitsDetails = value as? [[String: Any]] else { return [] }
        return fruitsDetails.map { FruitInfo(fruitDetails: $0) }
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



enum FruitsAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.fruityvice.com/api/fruit/all")!
        }
    }
}

struct FruitImage {
    let images: [String: String]
    
    static func getFruitImages() -> FruitImage {
        FruitImage(images: [
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
        ])
    }
}

