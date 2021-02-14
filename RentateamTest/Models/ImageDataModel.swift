//
//  ImageDataModel.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import RealmSwift

class ImageDataModel: Object {
    @objc dynamic var id = ""
    @objc dynamic var downloadDate = ""
    @objc dynamic var imageData: Data?
}
