//
//  FruitsLoader.swift
//  AboutFruitsApp
//
//  Created by Tia M on 8/5/24.
//

import Foundation

protocol IFruitsLoader {
    func loadFruits(handler: @escaping(Result<[Fruit], Error>) -> Void)
}

struct FruitsLoader: IFruitsLoader {
    private let networkClient: INetworkClient
    private let decoder: JSONDecoder
    
    init(networkClient: INetworkClient = NetworkClient(), decoder: JSONDecoder = JSONDecoder()) {
        self.networkClient = networkClient
        self.decoder = decoder
    }

// MARK: - URL
    private var fruitsURL: URL {
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {
            preconditionFailure("Unable to construct usersURL")
        }
        return url
    }
    
    func loadFruits(handler: @escaping (Result<[Fruit], Error>) -> Void) {
        networkClient.fetch(url: fruitsURL) { result in
            switch result {
            case .success(let data):
                do {
                    let fruits = try decoder.decode([Fruit].self, from: data)
                    handler(.success(fruits))
                } catch {
                    handler(.failure(error))
                }
                
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
