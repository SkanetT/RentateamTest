//
//  ListCollectionHandlerProtocol.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

protocol ListCollectionHandlerProtocol: AnyObject {
    var delegate: ListPresenterProtocol? { get set }
    func attach(_ collectionView: UICollectionView)
    func countDidReceive(count: Int)
}
