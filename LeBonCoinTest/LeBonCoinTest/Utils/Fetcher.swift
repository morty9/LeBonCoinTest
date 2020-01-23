//
//  WebServices.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class Fetcher<T: Decodable> {
    
    
    /// Fecth data from the url given
    /// - Parameters:
    ///   - url: url where data has to be fetched
    ///   - completion: data returned 
    func fetch(url: String, completion: @escaping ([T])-> Void) {
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data else {
                print(error!)
                completion([])
                return
            }
            
            let decoder = DataDecoder<T>()

            decoder.decodeData(data: data) { (decodedData) in
                completion(decodedData)
            }
            
        })

        task.resume()
    }
    
}

typealias ItemFecther = Fetcher<Item>
typealias CategoryFecther = Fetcher<Category>
