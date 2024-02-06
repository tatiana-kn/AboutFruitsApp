//
//  ViewController.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var fruitImageLabel: UILabel!
    @IBOutlet var fruitInfoLabel: UILabel!
    
    // MARK: - Public properties
    var selectedFruit: String?
    
    //MARK: Private properties
    private var fruits: Fruit = []
    private let networkManager = NetworkManager.shared

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitImageLabel.text = fruitImages[selectedFruit ?? ""]
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchFruits()
    }
}

// MARK: - UI Setup
extension DetailViewController {
    private func getFruitDescription() {
        guard let fruit = fruits.first(where: { $0.name == selectedFruit }) else {
            fruitInfoLabel.text = "No data found"
            return
        }
        fruitInfoLabel.text = fruit.description
    }
}


// MARK: - Networking
extension DetailViewController {
    private func fetchFruits() {
        networkManager.fetchFruits(from: FruitsAPI.baseURL.url) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let fruits):
                self.fruits = fruits
                getFruitDescription()
                activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}

