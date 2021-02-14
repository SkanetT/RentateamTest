//
//  ListViewProtocol.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import Foundation
protocol ListViewProtocol: AnyObject {
    func configureColletionView(_ handler: ListCollectionHandlerProtocol)
    func setModeTitle(_ text: String)
    func showDetails(data: ImageDataModel)
}
