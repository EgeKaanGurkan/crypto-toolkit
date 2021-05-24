//
//  DownloadData.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import Foundation
import SwiftUI

class DownloadData: ObservableObject {
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("coins.data")
    }
    
    @Published var listOfCoins: [CoinDetail] = [CoinDetail]() {
        didSet {
            DispatchQueue.main.async {
//                self.saveJSON()
            }
        }
    }
    
    @Published var dataHasLoaded: Bool = false
    
    func downloadJSON(){
        let headers = [
            "x-rapidapi-key": "66f442f14fmshcfb9e2b216340a1p1b619ajsna10444337f85",
            "x-rapidapi-host": "coinranking1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://coinranking1.p.rapidapi.com/coins")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            guard let data = data else { return }
//            print(String(data: data, encoding: .utf8)!)
            do {
                let curr: CoinResponse = try! JSONDecoder().decode(CoinResponse.self, from: data)
                let coinDetails = curr.data.coins
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.listOfCoins = coinDetails
                    self.listOfCoins.sort(by: { $0.id < $1.id })
                    print(self.listOfCoins[0])
                    self.dataHasLoaded = true
                    
                }
            } catch {
                print(error)
            }
        }

        dataTask.resume()
        
    }
    
    func checkIfDataHasLoaded() -> Bool {
        return dataHasLoaded
    }
    
    func saveJSON() {
//        print("lol")
        DispatchQueue.main.async { [weak self] in
            guard let listOfCoins = self?.listOfCoins else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(listOfCoins) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
    
}
