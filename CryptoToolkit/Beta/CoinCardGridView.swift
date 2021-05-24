//
//  CoinCardGridView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 27.04.2021.
//

import SwiftUI

struct CoinCardGridView: View {
    
    let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
    ]
    
    let data = (1...100).map { "Item \($0)" }
    
    var body: some View {
        ScrollView () {
            
            PopoverPortfolioView()
            Spacer()
            LazyVGrid(columns: columns) {
                
//                CoinCardView()
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
//                CoinCardView()
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
//                CoinCardView()
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
//                CoinCardView()
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                
                SmallCoinCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
                SmallCoinCardView(coinDetail: CoinDetail(name: "Ethereum", symbol: "ETH", price: "123123", id: 0, iconUrl: "asd"))
                
                ForEach(data, id: \.self) { item in
                    SmallCoinCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
                }
                
            }
        }
        .padding()
    }
}

struct CoinCardGridView_Previews: PreviewProvider {
    static var previews: some View {
        CoinCardGridView()
    }
}
