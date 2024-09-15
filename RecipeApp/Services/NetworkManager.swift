//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Prince Ch on 15/09/24.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchRecipes(page: Int, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let urlString = "https://dummyjson.com/recipes?limit=20&skip=\(page * 20)"
        
        AF.request(urlString).responseDecodable(of: RecipeResponse.self) { response in
            switch response.result {
            case .success(let recipeResponse):
                completion(.success(recipeResponse.recipes))
            case .failure(let error):
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }
    }
}
