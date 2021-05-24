//
//  CoinList.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

struct CoinList: View {
    
    @ObservedObject var downloadData = DownloadData()
    @ObservedObject var customColors = LoadCustomColors()
    @Binding var showIndex: Int
    @Binding var narrowMode: Bool
    @State var showSettings = false
    
    var body: some View {
        
        List {
            Section(header: Button(action: {
                self.showSettings.toggle()
            }) {
                Image(systemName: "gearshape.fill")
            }
            .popover(isPresented: self.$showSettings, arrowEdge: .leading, content: {
                SettingsPopover()
            })
            ) {
                if (downloadData.dataHasLoaded) {
                    ForEach(0 ..< downloadData.listOfCoins.count) { i in
                        CoinRow(showIndex: $showIndex, narrowMode: .constant(narrowMode), coin: downloadData.listOfCoins[i], imgName: downloadData.listOfCoins[i].name.lowercased())
                    }
                } else {
                    Text("Latest coin prices are being fetched...")
                }
            }
            
        }
        .onAppear(perform: {
            downloadData.downloadJSON()
        })
        
    }
    
    func printData() {
        print("PRINTING DATA: ")
        print(downloadData.listOfCoins)
    }
}

struct CoinList_Previews: PreviewProvider {
    static var previews: some View {
        CoinList(showIndex: .constant(0), narrowMode: .constant(false))
            .environmentObject(DownloadData())
            .environmentObject(LoadCustomColors())
    }
}
