//
//  CoinRow.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import SwiftUI

struct CoinRow: View {
    
    @Binding var showIndex: Int
    @Binding var narrowMode: Bool
    @State var buttonHoverEffect = false
    
    
    var coin: CoinDetail
    var imgName: String
//    var color: Color
    
//    var price = Double(coin.price)
    
    lazy var price = coin.price
    lazy var name = coin.name
//    lazy var color = Color(NSColor(named: coin.name)!)
    
    func mutablePrice() -> Double {
        var mutatableSelf = self
        return Double(mutatableSelf.price)!
    }
    
    func mutableName() -> String {
        var mutableSelf = self
        return mutableSelf.name
    }
    
    func getColor() -> Color {
        if (NSColor(named: mutableName()) != nil) {
            return Color(NSColor(named: mutableName())!)
        } else {
            return Color.orange
        }
    }
    
    func getImage() -> Image {
        if (NSImage(named: imgName) != nil) {
            return Image(imgName)
        } else {
            return Image("transparent")
        }
    }
    
    var profit = true
    var multiplier = 3
    
    var body: some View {
//        https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg
        Button(action: {self.showIndex = 1}) {
            HStack {
                
                getImage()
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.trailing, 10)
                
                HStack () {
                    Text(coin.name)
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(getColor())
                    
                    Text(coin.symbol)
                        .font(.system(.headline, design: .monospaced))
                        .fontWeight(.bold)
//                        .offset(x: buttonHoverEffect ? 3 : 0, y: 0)
                        .padding(.vertical, 1)
                        .padding(.horizontal, 3)
                        .background(RoundedRectangle(cornerRadius: 3.0)
                                        .fill(getColor())
                                        .scaleEffect(buttonHoverEffect ? 1.1 : 1)
                                        .animation(.easeInOut(duration: 0.1)
                                        )
                        )
                        .foregroundColor(Color.black)
                    
                        
                }
                
                Group {
                    Spacer()
                    HStack (alignment: .lastTextBaseline) {
                        Text("$" + String(format: "%.3f", mutablePrice()))
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                        Text("(+%\(multiplier))")
                            .foregroundColor(profit ? .green:.red)
                            .font(.system(size: 12, weight: .medium, design: .monospaced))
                        Image(systemName: "chevron.right")
                            .scaleEffect(buttonHoverEffect ? 1.2 : 1)
                            .offset(x: buttonHoverEffect ? 5.0 : 0, y: 0)
                            .animation(.easeInOut(duration: 0.1))
                            .padding(.trailing, 5)
                    }
                }
                .isHidden(narrowMode ? true : false, remove: narrowMode ? true : false)
                
            }
        }
        .buttonStyle(PlainButtonStyle())
        .onHover(perform: { hovering in
            self.buttonHoverEffect = hovering
        })
//        .background()
    }
}

struct CoinRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CoinRow(showIndex: .constant(1), narrowMode: .constant(false), coin: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "bitcoin"), imgName: "bitcoin")
            CoinRow(showIndex: .constant(1), narrowMode: .constant(true), coin: CoinDetail(name: "Ethereum", symbol: "ETH", price: "123123", id: 0, iconUrl: "ethereum"), imgName: "bitcoin")
        }

    }
}
