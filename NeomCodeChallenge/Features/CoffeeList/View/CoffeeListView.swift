//
//  CoffeeListView.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import SwiftUI

struct CoffeeListView: View {
    @ObservedObject var viewModel = CoffeeListViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                List {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    } else {
                        ForEach(viewModel.coffeeItems) { item in
                            NavigationLink(destination: CoffeeDetailsView(coffeeItem: item)) {
                                CoffeeItemRow(coffeeItem: item)
                            }
                        }
                    }
                }
                .navigationTitle("Coffee List")
                .refreshable {
                    viewModel.loadCoffeeItems()
                }

                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .scaleEffect(1.5)
                        .zIndex(1)
                }
            }
        }
    }
}

struct CoffeeItemRow: View {
    let coffeeItem: Coffee
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(coffeeItem.title)
                .font(.headline)
            Text(coffeeItem.description)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}
