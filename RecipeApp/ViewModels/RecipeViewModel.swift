//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Prince Ch on 15/09/24.
//

import Foundation

class RecipeViewModel {
    var recipes: [Recipe] = []
    var favoriteRecipes: Set<Int> = []

    func fetchRecipes(page: Int, completion: @escaping () -> Void) {
        NetworkManager.shared.fetchRecipes(page: page) { result in
            switch result {
            case .success(let newRecipes):
                self.recipes.append(contentsOf: newRecipes)
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }

    func toggleFavorite(recipeId: Int) {
        if favoriteRecipes.contains(recipeId) {
            favoriteRecipes.remove(recipeId)
        } else {
            favoriteRecipes.insert(recipeId)
        }
    }

    func isFavorite(recipeId: Int) -> Bool {
        return favoriteRecipes.contains(recipeId)
    }
}
