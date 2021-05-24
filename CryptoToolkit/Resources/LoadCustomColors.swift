//
//  LoadCustomColors.swift
//  CryptoToolkit
//
//  Created by Ege Kaan Gürkan on 25.04.2021.
//

import Foundation

final class LoadCustomColors: ObservableObject {
    @Published var customColors: [CustomColor] = load("colours.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        print(try decoder.decode(T.self, from: data))
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
