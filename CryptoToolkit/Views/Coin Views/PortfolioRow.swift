//
//  PortfolioRow.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 29.04.2021.
//

import SwiftUI

struct PortfolioRow: View {
    var body: some View {
        HStack {
            Text("My Portfolio")
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
            Spacer()
        }
    }
}

struct PortfolioRow_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioRow()
    }
}
