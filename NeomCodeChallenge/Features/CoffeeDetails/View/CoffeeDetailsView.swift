//
//  CoffeeDetailsView.swift
//  NeomCodeChallenge
//
//  Created by Nawaf AlMuaither on 11/03/2024.
//

import SwiftUI

struct CoffeeDetailsView: View {
    let coffeeItem: Coffee

    var body: some View {
        VStack {
            Spacer()
            AsyncImage(url: coffeeItem.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 300)
            .clipped()
            
            VStack(alignment: .leading, spacing: 12) {
                Text(coffeeItem.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(coffeeItem.description)
                    .font(.body)
            }
            .padding()
            .background(Color(uiColor: .systemBackground))
            .cornerRadius(20)
            .shadow(radius: 5)
            .offset(y: -40)
            
            Spacer()
        }.padding([.leading, .trailing])
        .edgesIgnoringSafeArea(.top)
        .navigationTitle("Coffee Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CoffeeDetailsView(coffeeItem: .sample)
        }
    }
}
