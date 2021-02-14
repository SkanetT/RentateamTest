//
//  ListPresenter.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

class ListPresenter: ListPresenterProtocol {
    
    private unowned let view: ListViewProtocol
    private let collectionHandler: ListCollectionHandlerProtocol
    private let realmService: RealmServiceProtocol
    private let networkService: NetworkServiceProtocol
    private var isOnline: Bool?
    
    init(view: ListViewProtocol,
         collectionHandler: ListCollectionHandlerProtocol,
         realmService: RealmServiceProtocol = RealmService(),
         networkService: NetworkServiceProtocol = NetworkService()) {
        
        self.realmService = realmService
        self.networkService = networkService
        self.collectionHandler = collectionHandler
        self.view = view
        self.collectionHandler.delegate = self
    }
    
    func viewDidLoad() {
        view.configureColletionView(collectionHandler)
    }
    
    func fetchImage(id: String, image: @escaping (Data?) -> Void) {
        if let data =  realmService.fetchImageData(id: id) {
            DispatchQueue.main.async {
                image(data)
            }
        } else {
            let size = Int(UIScreen.main.bounds.width )
            guard let url = URL(string: "https://picsum.photos/id/\(id)/\(size)") else { return }
            networkService.getData(from: url) { [weak self] data, response, error in
                guard let data = data, error == nil else { return }
                self?.realmService.saveImage(id: id.description, data: data)
                DispatchQueue.main.async {
                    image(data)
                }
            }
        }
    }
    
    func determineOnline() {
        guard isOnline != Reachability.isConnectedToNetwork() || isOnline == nil else { return }
        if Reachability.isConnectedToNetwork() {
            collectionHandler.countDidReceive(count: GlobalConstants.apiImageCount)
            DispatchQueue.main.async {
                self.view.setModeTitle("Online mode")
            }
        } else {
            collectionHandler.countDidReceive(count: realmService.fetchDataCount())
            DispatchQueue.main.async {
                self.view.setModeTitle("Offline mode")
            }
        }
        isOnline = Reachability.isConnectedToNetwork()        
    }
    
    func attemptGetData(id: String) {
        
        guard let imageData = realmService.fetchImageData(id: id), let _ = UIImage(data: imageData) else { return }
        
        if let data = realmService.fetchFullData(id: id) {
            view.showDetails(data: data)
        }
    }
}

