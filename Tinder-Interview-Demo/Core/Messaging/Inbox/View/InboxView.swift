//
//  InboxView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/27/24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            List {
                NewMatchesView()
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Matches")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    InboxView()
}
