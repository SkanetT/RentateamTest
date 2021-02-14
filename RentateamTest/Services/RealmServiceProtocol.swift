//
//  RealmServiceProtocol.swift
//  RentateamTest
//
//  Created by Антон on 14.02.2021.
//

import Foundation

protocol RealmServiceProtocol: AnyObject {
    func saveImage(id: String, data: Data)
    func fetchImageData(id: String) -> Data?
    func fetchFullData(id: String) -> ImageDataModel?
    func fetchDataCount() -> Int
}
