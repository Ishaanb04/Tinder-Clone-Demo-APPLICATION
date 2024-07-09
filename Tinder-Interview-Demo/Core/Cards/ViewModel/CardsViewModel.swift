//
//  CardsViewModel.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/25/24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?

    private let service: CardService

    init(service: CardService) {
        self.service = service
        Task {
            await fetchCardModel()
        }
    }

    func fetchCardModel() async {
        do {
            cardModels = try await service.fetchCardModels()
        } catch {
            print("Debug: Failed to fetch cards with error: \(error)")
        }
    }

    func removeCard(_ card: CardModel) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)
    }
}
