//
//  MainConfigurator.swift
//  AboutFruitsApp
//
//  Created by Tia M on 8/5/24.
//

import Foundation

final class MainConfigurator {
    func configure() -> MainViewController {
        let decoder = JSONDecoder()
        let networkClient = NetworkClient()
        let viewController = MainViewController()
        
        viewController.fruitsLoader = FruitsLoader(networkClient: networkClient, decoder: decoder)

        return viewController
    }
}
