//
//  RealmService.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import Foundation
import RealmSwift

class RealmService: RealmServiceProtocol {
    
    func saveImage(id: String, data: Data) {
        let realm = try! Realm()
        let model = ImageDataModel()
        model.id = id
        model.imageData = data
        model.downloadDate = Date().makeCurrentDateAndTime()
        try! realm.write {
            realm.add(model)
        }
    }
    
    func fetchImageData(id: String) -> Data? {
        let models = try! Realm().objects(ImageDataModel.self)
        if let model = models.first(where: {$0.id == id}) {
            return model.imageData
        } else {
            return nil
        }
    }
    
    func fetchFullData(id: String) -> ImageDataModel? {
        let models = try! Realm().objects(ImageDataModel.self)
        if let model = models.first(where: {$0.id == id}) {
            return model
        } else {
            return nil
        }
    }
    
    func fetchDataCount() -> Int {
        let models = try! Realm().objects(ImageDataModel.self)
        return models.count
    }
}
