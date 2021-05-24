//
//  PortfolioCardView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 29.04.2021.
//

import SwiftUI

struct PortfolioCardView: View {
    @State var hover = false
    @State var fave = true
    
    var coinDetail: CoinDetail
    
    func getFont(size: CGFloat) -> Font {
        return Font.custom("RecoletaAlt-Regular", size: size)
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            
            HStack () {
                Image(nsImage: NSImage(named: coinDetail.name.lowercased())!)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .shadow(color: .black, radius: self.hover ? 5 : 0)
                    .animation(.easeInOut(duration: 0.1))
                
                Text(coinDetail.symbol)
                    .font(getFont(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(.white)

                
                Spacer()
                
                Button(action: {self.fave.toggle()}) {
                    if (fave) {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {print("add to portfolio")}) {
                    Image(systemName: "pencil")
                }
                .buttonStyle(PlainButtonStyle())
                
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            .padding(.bottom, 5)
            .background(Color(NSColor(named: coinDetail.name)!))
            .cornerRadius(3)
            .shadow(color: .black, radius: 5)
            
            HStack (alignment: .lastTextBaseline, spacing: 3){
                VStack (alignment: .leading, spacing: -7){
                    Text("Price")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text("54680")
                        .padding(.top, 9)
                }
                Text("x")
                VStack (alignment: .leading, spacing: -7){
                    Text("Portfolio")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text("0.00058")
                        .padding(.top, 9)
                }
//                Spacer()
            }
            .foregroundColor(.black)
            .font(.system(size: 12, weight: .medium, design: .monospaced))
            .padding(10)
            .zIndex(-1)
            .offset(y: -3)
            
            HStack {
                Text("=")
                    .foregroundColor(.black)
                    .font(.title2)
                
                Text("31.7144")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .medium, design: .monospaced))
            }
            .padding(.leading, 10)
            .padding(.bottom, 10)
            
        }
        .onHover(perform: { hovering in
            self.hover = hovering
        })
        .background(Color.white)
        .cornerRadius(3.0, antialiased: true)
    }
}

struct PortfolioCardView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
    }
}
