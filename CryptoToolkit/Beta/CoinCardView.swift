//
//  CoinCardView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 26.04.2021.
//

import SwiftUI

struct CoinCardView: View {
        
    @State var extended = true
    
    var body: some View {
        ZStack (alignment: .center) {
            
            if (self.extended) {
                
                RoundedRectangle(cornerRadius: 3.0)
                    .fill(Color(NSColor(named: "Ethereum")!))
                    .frame(height: 200)
//                    .transition(.move(edge: .))
                    .transition(.move(edge: .bottom))
//                    .offset(y: -30)
                
            }
            
            Button(action: {
                
                withAnimation {
                    self.extended.toggle()
                }
            
            }) {
                HStack {
                    Image(nsImage: NSImage(named: "ethereum")!)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Ethereum")
    //                    .font(.title)
    //                    .fontWeight(.semibold)
                        .font(Font.custom("RecoletaAlt-Regular", size: 30))
                        .fontWeight(.medium)
                        
                }
                .padding(3)
                .background(Rectangle()
                                .fill(Color(NSColor(named: "Ethereum")!))
                            )
                .cornerRadius(7)
                
            }
            .buttonStyle(PlainButtonStyle())
            .offset(y: self.extended ? -70 : 0)
            
        }
        
        
    }
}

struct CoinCardView_Previews: PreviewProvider {
    static var previews: some View {
        CoinCardView()
    }
}
