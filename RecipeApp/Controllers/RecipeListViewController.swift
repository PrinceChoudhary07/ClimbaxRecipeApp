//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Prince Ch on 15/09/24.
//

import UIKit
import Kingfisher

class RecipeListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = RecipeViewModel()
    var page = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchRecipes()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecipeCell.self, forCellReuseIdentifier: "RecipeCell")
    }

    func fetchRecipes() {
        viewModel.fetchRecipes(page: page) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension RecipeListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell else {
            return UITableViewCell()
        }
        let recipe = viewModel.recipes[indexPath.row]
        let isFavorite = viewModel.favoriteRecipes.contains(recipe.id)
        cell.configure(with: recipe, isFavorite: isFavorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = viewModel.recipes[indexPath.row]
        viewModel.toggleFavorite(recipeId: recipe.id)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            page += 1
            fetchRecipes()
        }
    }
}
