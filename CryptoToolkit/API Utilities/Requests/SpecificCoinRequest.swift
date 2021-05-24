//
//  SpecificCoinRequest.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import Foundation

struct SpecificCoinRequest {
    
    let resourceURL:URL
    var dataTask: URLSessionDataTask?

    
    init(coinId:Int) {
        let resourceString = "https://coinranking1.p.rapidapi.com/coin/\(coinId)"
        
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        
        self.resourceURL = resourceURL
    }
    
    func getCoins(completion: @escaping(Result<CoinDetail, CoinError>) -> Void) {
        
        let headers = [
            "x-rapidapi-key": "66f442f14fmshcfb9e2b216340a1p1b619ajsna10444337f85",
            "x-rapidapi-host": "coinranking1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: resourceURL.absoluteString)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            guard let data = data else { return }
            
            print (resourceURL)
            print("\n\n" + String(data: data, encoding: .utf8)! + "\n\n")
            do {
                let curr: SpecificCoinResponse = try! JSONDecoder().decode(SpecificCoinResponse.self, from: data)
                let coinDetails = curr.data.coin
                completion(.success(coinDetails))
            } catch {
                completion(.failure(.cannotProcessData))
                print(error)
            }
        }
        dataTask.resume()
    }
    
    
}
