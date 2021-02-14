//
//  UIImage.swift
//  RentateamTest
//
//  Created by Антон on 13.02.2021.
//

import UIKit

extension UIImage {
    func getMetaData() -> String? {
        var metaData: String? = nil
        var colorModel = "no data"
        var depth = "no data"
        var profileName = "no data"
        guard let data = self.jpegData(compressionQuality: 1.0) else { return nil }
        data.withUnsafeBytes {
            let bytes = $0.baseAddress?.assumingMemoryBound(to: UInt8.self)
            guard let cfData = CFDataCreate(kCFAllocatorDefault, bytes, data.count), let source = CGImageSourceCreateWithData(cfData, nil) else { return }
            let exifData = CGImageSourceCopyPropertiesAtIndex(source, 0, nil)
            guard let dictionary = exifData as? [String: Any]  else { return }
            if let colorModelFromData = dictionary["ColorModel"] as? String {
                colorModel = colorModelFromData
            }
            if let depthModelFromData = dictionary["Depth"] as? Int {
                depth = String(depthModelFromData)
            }
            if let profileNameFromData = dictionary["ProfileName"] as? String {
                profileName = profileNameFromData
            }
            metaData = """
                        Color Model: \(colorModel)
                        Depth: \(depth)
                        Profile Name: \(profileName)
                       """
        }
        return metaData
    }
}

