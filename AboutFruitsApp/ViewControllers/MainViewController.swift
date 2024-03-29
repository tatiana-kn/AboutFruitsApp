//
//  MainViewController.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/2/24.
//

import UIKit

final class MainViewController: UICollectionViewController {
    let fruitImages = FruitImage.getFruitImages()
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fruitImages.images.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        let fruitImage = Array(fruitImages.images.values)[indexPath.item]
        cell.userActionLabel.text = fruitImage
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        let selectedFruit = Array(fruitImages.images.keys)[indexPath.item]
        
        detailVC.selectedFruit = selectedFruit
    }
}

// MARK: - UI Setup
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 80, height: 90)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
