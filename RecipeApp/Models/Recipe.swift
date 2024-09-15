//
//  Recipe.swift
//  RecipeApp
//
//  Created by Prince Ch on 15/09/24.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
    let total: Int
    let limit: Int
    let skip: Int
}

struct Recipe: Codable {
    let id: Int
    let name: String
    let image: String
    let cookTimeMinutes: Int
    let prepTimeMinutes: Int
    let caloriesPerServing: Int
    let cuisine: String
    let difficulty: String
    let rating: Double
    let reviewCount: Int
    let servings: Int
    let ingredients: [String]
    let instructions: [String]
    let tags: [String]
    let mealType: [String]
}
