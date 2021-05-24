//
//  PopoverPortfolioView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 29.04.2021.
//

import SwiftUI

struct PopoverPortfolioView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("My Portfolio")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
            .padding(5)
            .padding(.horizontal, 10)
            
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    PortfolioCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
                    PortfolioCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
                    PortfolioCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
                    
                }
                .padding(.horizontal, 10)
            }
            
            
            Spacer()
            
        }
        .background(Rectangle().fill(Color.black)
                        .opacity(0.2))
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: 8)
        
    }
}

struct PopoverPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverPortfolioView()
    }
}
