//
//  ListPresenterProtocol.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import Foundation

protocol ListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func fetchImage(id: String, image: @escaping (Data?) -> Void)
    func determineOnline()
    func attemptGetData(id: String)
}
