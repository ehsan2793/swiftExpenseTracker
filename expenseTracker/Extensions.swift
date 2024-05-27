//
//  Extensions.swift
//  expenseTracker
//
//  Created by Ehsan Rahimi on 5/26/24.
//

import Foundation
import SwiftUI

extension DateFormatter {
    static let allNumaricUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"

        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumaricUSA.date(from: self)
        else {
            return Date()
        }
        return parsedDate
    }
}
