//
//  Date.swift
//  RentateamTest
//
//  Created by Антон on 14.02.2021.
//

import Foundation

extension Date {
    func makeCurrentDateAndTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        let result = formatter.string(from: self)
        return result
    }
}
