//
//  ViewController.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import UIKit

final class DetailViewController: UIViewController {
    let fruitImages = FruitImage.getFruitImages()
    
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
        
        fruitImageLabel.text = fruitImages.images[selectedFruit ?? ""]
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
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Networking
extension DetailViewController {
    private func fetchFruits() {
        networkManager.fetchFruits(from: FruitsAPI.baseURL.url) { [unowned self] result in
            switch result {
            case .success(let fruits):
                self.fruits = fruits
                getFruitDescription()
                activityIndicator.stopAnimating()
            case .failure(let error):
                showAlert(withTitle: "Oops!", andMessage: error.localizedDescription)
            }
        }
    }
}

