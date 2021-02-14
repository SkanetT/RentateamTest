//
//  NetworkServiceProtocol.swift
//  RentateamTest
//
//  Created by Антон on 14.02.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
