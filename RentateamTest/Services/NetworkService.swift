//
//  NetworkApi.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
