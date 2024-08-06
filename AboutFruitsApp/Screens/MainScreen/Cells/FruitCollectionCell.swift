//
//  FruitCollectionCell.swift
//  AboutFruitsApp
//
//  Created by Tia M on 8/4/24.
//

import UIKit

final class FruitCollectionCell: UICollectionViewCell {
    static let reuseID = "FruitCollectionCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Fruit"
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .darkGray
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ fruit: Fruit) {
        nameLabel.text = fruit.name
        imageView.image = UIImage(named: fruit.name) ?? UIImage(named: "default")
    }
}

//MARK: - Layout
extension FruitCollectionCell {
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
