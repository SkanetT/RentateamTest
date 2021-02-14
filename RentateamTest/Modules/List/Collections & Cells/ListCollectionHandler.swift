//
//  ListCollectionHandler.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

class ListCollectionHandler: NSObject,
                             UICollectionViewDataSource,
                             UICollectionViewDelegate {
    
    weak var delegate: ListPresenterProtocol?
    private var collectionView: UICollectionView?
    private var count = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return .init() }
        delegate?.fetchImage(id: indexPath.row.description) { data in
            cell.setData(data: data)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.attemptGetData(id: indexPath.row.description)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.determineOnline()
    }
}

extension ListCollectionHandler: ListCollectionHandlerProtocol {
    func attach(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(UINib(nibName: ListCell.identifier, bundle: nil), forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        delegate?.determineOnline()
    }
    
    func countDidReceive(count: Int) {
        self.count = count
        collectionView?.reloadData()
    }
}
