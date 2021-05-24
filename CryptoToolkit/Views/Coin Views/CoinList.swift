//
//  CoinList.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import SwiftUI

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
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
    
    var body: some View {
        
        List {
            Button(action: {exit(0)}) {
                Text("Exit")
            }
            if (downloadData.dataHasLoaded) {
                Text("asd")
                ForEach(0 ..< downloadData.listOfCoins.count) { i in
                    CoinRow(showIndex: $showIndex, narrowMode: .constant(narrowMode), coin: downloadData.listOfCoins[i], imgName: downloadData.listOfCoins[i].name.lowercased())
                }
            } else {
                Text("items are loading")
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
