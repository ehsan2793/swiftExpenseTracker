//
//  expenseTrackerApp.swift
//  expenseTracker
//
//  Created by Ehsan Rahimi on 5/26/24.
//

import SwiftUI

@main
struct expenseTrackerApp: App {
    @StateObject var transcationListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transcationListVM)
        }
    }
}
