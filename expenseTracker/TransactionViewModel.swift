//
//  TransactionViewModel.swift
//  expenseTracker
//
//  Created by Ehsan Rahimi on 5/27/24.
//

import Combine
import Foundation

// ObservableObject is part of combine framework
// that turns any object into publisher and will notify subscribers of state change so they can refersh their views

final class TransactionListViewModel: ObservableObject {
//    @Published is a property wrapper is responsible for
//    sending notifications to the subscribers whenever its value has been changed
    @Published var transactions: [Transaction] = []
    private var cancealables = Set<AnyCancellable>()

    init() {
        getTransactions()
    }

    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json")
        else {
            print("Invalid URL")
            return
        }

        // To Feach data from api in swift it demand url season data task

        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("error fetching transactions", error.localizedDescription)
                case .finished:
                    print("Finshed fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
            }.store(in: &cancealables)
    }
}
