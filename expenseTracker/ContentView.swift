//
//  ContentView.swift
//  expenseTracker
//
//  Created by Ehsan Rahimi on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                } //: Vstack
                .padding()
                .frame(maxWidth: .infinity)
            } //: Scrollview
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            } //: toolbar
        } //: Navigation
    }
}

#Preview {
    ContentView()
}
