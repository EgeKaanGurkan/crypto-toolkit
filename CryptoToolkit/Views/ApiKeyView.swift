//
//  apiKeyView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.05.2021.
//

import SwiftUI

struct ApiKeyView: View {
    
    @State var apiKey: String = ""
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text("Setup")
                .font(.system(size: 40, design: .rounded))
                .fontWeight(.medium)
                .selfSizeMask(
                    LinearGradient(
                        gradient: Gradient(colors: [.init(hex: "FF0072"), .init(hex: "FFCD00")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
            Spacer()
            Text("Please enter your Coinranking API key")
            Text("This key will be used in the future iterations of the app.")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                
            TextField("API Key", text: $apiKey)
            HStack {
                Button(action: {
                    setApiKey(apiKey: apiKey)
                }) {
                    Text("Set API Key")
                }
                .disabled(self.apiKey.isEmpty)
                .padding(.vertical)
                
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "apiKeyGotten")
                    UserDefaults.standard.set("You can set this up later", forKey: "apiKey")
                }) {
                    Text("Skip This Step")
                }
            }
            
            Text("Click the button below if you do not have a Coinrankin API Key.")
            
            Button(action: {
                    openURL(URL(string: "https://coinranking.com/page/key-generator")!)
                
            }) {
                Text("Coinranking API Key Website")
            }
        
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

func setApiKey(apiKey: String) {
    UserDefaults.standard.set(true, forKey: "apiKeyGotten")
    UserDefaults.standard.set(apiKey, forKey: "apiKey")
    UserDefaults.standard.synchronize()
}

struct ApiKeyView_Previews: PreviewProvider {
    static var previews: some View {
        ApiKeyView()
    }
}
