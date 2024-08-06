//
//  ViewController.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/1/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private var fruit: Fruit?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.8 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.8 * width).isActive = true
        return imageView
    }()
    
    private var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Fruit"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 22)
        descriptionLabel.textColor = .darkGray
        return descriptionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func update(_ fruit: Fruit) {
        self.fruit = fruit
        imageView.image = UIImage(named: fruit.name) ?? UIImage(named: "default")
        descriptionLabel.text = fruit.description
    }
}

//MARK: - Layout
extension DetailViewController {
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
    }
}

#Preview(traits: .portrait) {
    DetailViewController()
}

