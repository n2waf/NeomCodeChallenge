//
//  CoffeeListViewModel.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import Combine
import SwiftUI

class CoffeeListViewModel: ObservableObject {
    @Published var coffeeItems = [Coffee]()
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private var hasLoadedInitially = false
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadCoffeeItems()
    }

    func loadCoffeeItems() {
        guard !hasLoadedInitially else {
            fetchData()
            return
        }
        
        isLoading = true
        fetchData()
    }
    
    
    private func fetchData() {
        NetworkService.coffeeList()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                self?.hasLoadedInitially = true
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] coffeeItems in
                self?.coffeeItems = coffeeItems
            })
            .store(in: &cancellables)
    }
}
