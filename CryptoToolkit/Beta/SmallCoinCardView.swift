//
//  SmallCoinCardView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 27.04.2021.
//

import SwiftUI

struct SmallCoinCardView: View {
    
    @State var hover = false
    @State var fave = true
    
    var coinDetail: CoinDetail
    
    func getFont(size: CGFloat) -> Font {
        return Font.custom("RecoletaAlt-Regular", size: size)
    }
    
    var body: some View {
        VStack (alignment: .center, spacing: 0) {
            
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
                    Image(systemName: "plus")
                }
                .buttonStyle(PlainButtonStyle())
                
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            .padding(.bottom, 5)
            .background(Color(NSColor(named: coinDetail.name)!))
            .cornerRadius(3)
            .shadow(color: .black, radius: 5)
            
            HStack (alignment: .center){
                Text("asd")
                    .padding(.top, 9)
                    .padding(.bottom, 6)
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                Spacer()
            }
            .padding(.leading, 30)
            .background(Color.white)
            .zIndex(-1)
            .cornerRadius(3.0, antialiased: true)
            .offset(y: -3)
            
        }
        .onHover(perform: { hovering in
            self.hover = hovering
        })
    }
}

struct SmallCoinCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCoinCardView(coinDetail: CoinDetail(name: "Bitcoin", symbol: "BTC", price: "123123", id: 0, iconUrl: "asd"))
    }
}
