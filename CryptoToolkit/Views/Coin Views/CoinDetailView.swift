//
//  CoinDetail.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import SwiftUI

struct CoinDetailView: View {
    
    @Binding var showIndex: Int
//    var coin: CoinDetail
    
    var coin: CoinDetail
    
    lazy var price = coin.price
    func mutablePrice() -> Double {
        var mutatableSelf = self
        return Double(mutatableSelf.price)!
    }
    
    
    lazy var name = coin.name
    func mutableName() -> String {
        var mutableSelf = self
        return String(mutableSelf.name)
    }
    
    func getColor() -> Color {
        if (NSColor(named: mutableName()) != nil) {
            return Color(NSColor(named: mutableName())!)
        } else {
            return Color.orange
        }
    }
    
//    var price: Double = 50790.34
    var multiplier: Double = 37.5
    var increase: Bool = true
    
    var coinColor =  Color(red: 255 / 255, green: 0 / 255, blue: 111 / 255)
    
    var body: some View {
        VStack (alignment: .leading) {
//            Button(action: {
//
//                self.showIndex = 0
//            }) {
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.white)
//            }
//            .buttonStyle(PlainButtonStyle())
//            .padding(.bottom, 10)
            
            HStack (alignment: .lastTextBaseline) {
                Text(coin.name)
                    .font(.system(size: 40, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(getColor())
                Text(coin.symbol)
                    .font(.system(size: 20, design: .monospaced))
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.bottom, 10)
            
            HStack (alignment: .lastTextBaseline) {
                Text("Price: ")
                    .font(.headline)
                Text(String(format: "%.3f", mutablePrice()))
                    .font(.system(.headline, design: .monospaced))
                Text(String(format: "(+%.1f)", multiplier))
                    .foregroundColor(increase ? .green:.red)
                    .font(.system(.subheadline, design: .monospaced))
            }
            Spacer()
        }
        .padding()
    }
}

struct CoinDetail_PreviewsView: PreviewProvider {
    static var previews: some View {
        Group {
            CoinDetailView(showIndex: .constant(1), coin: CoinDetail(name: "Ethereum", symbol: "ETH", price: "123124", id: 1, iconUrl: "adad"))
            CoinDetailView(showIndex: .constant(1), coin: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123124", id: 0, iconUrl: "adad"))
        }
    }
}
