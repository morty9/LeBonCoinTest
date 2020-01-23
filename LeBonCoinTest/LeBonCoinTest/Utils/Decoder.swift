//
//  Parsers.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class DataDecoder<T: Decodable> {
    /// Decode data to json array
    /// - Parameters:
    ///   - data: data to decode
    ///   - completion: json returned
    func decodeData(data: Data, completion: (_ result: [T]) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let res = try decoder.decode([T].self, from: data)
            completion(res)
        } catch {
            print(error.localizedDescription)
        }
    }
}
