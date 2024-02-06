//
//  NetworkManager.swift
//  AboutFruitsApp
//
//  Created by Tia M on 2/3/24.
//

import Foundation
import Alamofire
enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager: Error {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchFruits(from url: URL, completion: @escaping(Result<[FruitInfo], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponce in
                switch dataResponce.result {
                case .success(let value):
                    let fruits = FruitInfo.getFruits(from: value)
                    completion(.success(fruits))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


