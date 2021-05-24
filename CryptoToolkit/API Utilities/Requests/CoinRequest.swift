//
//  CoinRequest.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import Foundation

struct CoinRequest {
    
    func getCoins(completion: @escaping(Result<[CoinDetail], CoinError>) -> Void) {
        
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
                completion(.success(coinDetails))
            } catch {
                completion(.failure(.cannotProcessData))
                print(error)
            }
        }

        dataTask.resume()
    }
}
