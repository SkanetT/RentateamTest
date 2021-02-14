//
//  DetailsPresenter.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol {
    
    private unowned let view: DetailsViewProtocol
    private let data: ImageDataModel
    
    init(view: DetailsViewProtocol, data: ImageDataModel) {
        self.view = view
        self.data = data
    }
    
    func viewDidLoad() {
        view.setData(data)
    }
}
