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



