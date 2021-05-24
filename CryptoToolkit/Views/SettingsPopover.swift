//
//  SettingsPopover.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.05.2021.
//

import SwiftUI

struct SettingsPopover: View {
    
    @State var apiKey: String = ""
    
    var body: some View {
        VStack() {
            Text("Current API Key: " + UserDefaults.standard.string(forKey: "apiKey")!)
            TextField("New API Key", text: $apiKey)
            HStack {
                Button(action: {
                    changeKey(apiKey: apiKey)
                }, label: {
                    Text("Change API Key")
                })
                .disabled(self.apiKey.isEmpty)
                
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "apiKeyGotten")
                }, label: {
                    Text("Remove API Key")
                })
            }
            Button(action: {
                exit(0)
            }, label: {
                Text("Exit App")
            })
        }
        .padding()
        .frame(minWidth: 100)
    }
}

func changeKey(apiKey: String) {
    UserDefaults.standard.set(true, forKey: "apiKeyGotten")
    UserDefaults.standard.set(apiKey, forKey: "apiKey")
    UserDefaults.standard.synchronize()
}

struct SettingsPopover_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPopover()
    }
}
