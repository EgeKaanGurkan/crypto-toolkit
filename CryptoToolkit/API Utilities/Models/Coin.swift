//
//  Coin.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 24.04.2021.
//

import Foundation

struct CoinResponse: Decodable {
    var data:Coins
}

struct Coins: Decodable {
    var coins:[CoinDetail]
}

struct CoinDetail: Decodable, Hashable, Identifiable, Encodable {
    var name:String
    var symbol:String
    var price:String
    var id: Int
//    var description: String
    var iconUrl: String
//    var color: String
//    var websiteUrl: String
    
}

struct SpecificCoinResponse: Decodable {
    var data: SpecificCoin
}

struct SpecificCoin: Decodable {
    var coin:CoinDetail
}
