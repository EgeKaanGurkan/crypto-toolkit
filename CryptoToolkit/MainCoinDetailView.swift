//
//  MainCoinDetailView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 26.04.2021.
//

import SwiftUI

struct MainCoinDetailView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("Bitcoin")
                .foregroundColor(Color(NSColor(named: "Bitcoin")!))
                .font(.system(size: 35, weight: .semibold))
            HStack {
                Text("Price: ")
                    .font(.system(size: 17))
                Text("59000")
                    .font(.system(size: 15, weight: .medium, design: .monospaced))
            }
        }
    }
}

struct MainCoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainCoinDetailView()
    }
}
