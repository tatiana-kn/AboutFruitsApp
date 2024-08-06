//
//  MainViewController.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/2/24.
//

import UIKit

final class MainViewController: UIViewController {
    var fruitsLoader = FruitsLoader()
    private var fruits: [Fruit] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let itemCount:CGFloat = 3
        let padding:CGFloat = 20
        let paddingCount = itemCount + 1
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemCount
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: cellSize, height: cellSize * 1.25)
        
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FruitCollectionCell.self, forCellWithReuseIdentifier: FruitCollectionCell.reuseID)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        loadFruits()
    }
}

//MARK: - Layout
extension MainViewController {
    private func setupViews() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fruits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCollectionCell.reuseID, for: indexPath) as? FruitCollectionCell else {
            return UICollectionViewCell()
        }
        cell.update(fruits[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fruit = fruits[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.update(fruit)
        present(detailVC, animated: true)
    }
}

// MARK: - Networking
extension MainViewController {
    private func loadFruits() {
        fruitsLoader.loadFruits { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let fruits):
                
                DispatchQueue.main.async {
                    self.fruits = fruits
                    self.collectionView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

#Preview(traits: .portrait) {
    MainViewController()
}
