//
//  TranscationRow.swift
//  expenseTracker
//
//  Created by Ehsan Rahimi on 5/27/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TranscationRow: View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20.0) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                }

            VStack(alignment: .leading, spacing: 6.0) {
                // MARK: - Transaction Merchant

                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)

                // MARK: - Transaction Category

                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)

                // MARK: - Transaction Data

                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // MARK: Transaction Amount

            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

#Preview {
    Group {
        TranscationRow(transaction: transactionPreviewData)
    }
}
