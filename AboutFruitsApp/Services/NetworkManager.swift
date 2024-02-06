//
//  NetworkManager.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/3/24.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager: Error {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchFruits(from url: URL, completion: @escaping(Result<[FruitInfo], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error ?? "No error description")
                return
            }
            do {
                let fruits = try JSONDecoder().decode([FruitInfo].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(fruits))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}


