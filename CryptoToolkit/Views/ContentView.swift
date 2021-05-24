//
//  ContentView.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var downloadData = DownloadData()
    @ObservedObject var customColors = LoadCustomColors()
    @State private var showIndex: Int = 0
    @State private var narrowMode: Bool = true
    
    func isNarrow(width: CGFloat) -> Bool {
        if (width < 1300) {
            return true
        } else {
            return false
        }
    }
    
//    func save() -> String {
//        downloadData.saveJSON()
//        return ""
//    }
    
    var body: some View {
//        CoinDetailView()
        GeometryReader { geometry in
            NavigationView {
                List {
                    if (downloadData.dataHasLoaded) {
                        NavigationLink(destination: SampleView()) {
                            PortfolioRow()
                        }
                        
                        Section(header: Text("Coins")) {
                            ForEach(0 ..< downloadData.listOfCoins.count) { i in
                                NavigationLink (destination: CoinDetailView(showIndex: .constant(showIndex), coin: downloadData.listOfCoins[i])){
                                    CoinRow(showIndex: $showIndex, narrowMode: .constant(isNarrow(width: geometry.size.width)), coin: downloadData.listOfCoins[i], imgName: downloadData.listOfCoins[i].name.lowercased())
                                }
                            }
                        }
                    } else {
                        Text("items are loading")
                    }
                }
                .frame(minWidth: isNarrow(width: geometry.size.width) ? 250 : geometry.size.width * 0.3)
                .onAppear(perform: {
                    downloadData.downloadJSON()
                })
            }
            .navigationTitle("ASD")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DownloadData())
//            .environmentObject(LoadCustomColors())
    }
}
