//
//  PopoverContentView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 25.04.2021.
//

import SwiftUI

struct PopoverContentView: View {
    @ObservedObject var listOfCoins = DownloadData()
    @ObservedObject var customColors = LoadCustomColors()

    @State private var showIndex: Int = 0
    
    @AppStorage("apiKeyGotten")
    var apiKeyGotten: Bool = false
    
    var body: some View {
//        CoinDetailView()
        
        if (!apiKeyGotten) {
            apiKeyView()
        } else {
            if (showIndex == 0) {
                CoinList(showIndex: $showIndex, narrowMode: .constant(false))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(AnyTransition.move(edge: .leading)).animation(.default)
                    .environmentObject(self.listOfCoins)
                    .environmentObject(self.customColors)
            }
            if (showIndex == 1) {
                CoinDetailView(showIndex: $showIndex, coin: listOfCoins.listOfCoins[0])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(AnyTransition.move(edge: .trailing)).animation(.default)
                    .environmentObject(self.listOfCoins)
                    .environmentObject(self.customColors)
            }
            if (showIndex == 2) {
                CoinCardView()
            }
            if (showIndex == 3) {
                CoinCardGridView()
            }
        }
        
    }
}

struct PopoverContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverContentView()
            .environmentObject(DownloadData())
    }
}
