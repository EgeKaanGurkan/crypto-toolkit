//
//  apiKeyView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.05.2021.
//

import SwiftUI

struct apiKeyView: View {
    
    @State var apiKey: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text("Please enter your Coinranking API key")
            TextField("API Key", text: $apiKey)
        }
    }
}

struct apiKeyView_Previews: PreviewProvider {
    static var previews: some View {
        apiKeyView()
    }
}
