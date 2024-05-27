//
//  TransactionModel.swift
//  expenseTracker
//
//  Created by Ehsan Rahimi on 5/27/24.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryld: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool

    //: COMPUTED PROPERTIES

    var dateParsed: Date {
        date.dateParsed()
    }

    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String {
    case debit
    case credit
}
