//
//  CardStackView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/22/24.
//

import SwiftUI

struct CardStackView: View {
    @EnvironmentObject var matchManger: MatchManager
    @StateObject var viewModel = CardsViewModel(service: CardService())
    @State private var showMatchedView = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(viewModel.cardModels) { card in
                            CardView(viewModel: viewModel, model: card)
                        }
                    }
                    if !viewModel.cardModels.isEmpty {
                        SwipeActionButtonsView(viewModel: viewModel)
                    }
                }
                .blur(radius: showMatchedView ? 20 : 0)
                if showMatchedView {
                    UserMatchView(show: $showMatchedView)
                }
            }
            .animation(.easeInOut, value: showMatchedView)
            .onReceive(matchManger.$matcheduser) { user in
                showMatchedView = user != nil
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager(service: MockMatchService()))
}
