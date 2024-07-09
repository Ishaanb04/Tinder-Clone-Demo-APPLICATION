//
//  SwipeActionButtonsView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/26/24.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: CardsViewModel
    var body: some View {
        HStack(spacing: 32) {
            Button {
                viewModel.buttonSwipeAction = .reject
            } label: {
                SwipeActionButton(foregroundColor: .red, imageName: "xmark")
            }
            .frame(width: 48, height: 48)

            Button {
                viewModel.buttonSwipeAction = .like
            } label: {
                SwipeActionButton(foregroundColor: .green, imageName: "heart.fill")
            }
            .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SwipeActionButtonsView(viewModel: CardsViewModel(service: CardService()))
}
