//
//  WebServices.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class APIItemHandler {
    
    func getItems(completion: @escaping (_ result: [Item]) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            let decoder = JSONDecoder()
        
            do {
                guard let data = data else {
                    return
                }
                let res = try decoder.decode([Item].self, from: data)
                completion(res)
            } catch {
                print(error.localizedDescription)
            }
        })

        task.resume()
        
    }
    
}

class APICategoryHandler {
    
    func getCategories(completion: @escaping (_ result: [Category]) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            let decoder = JSONDecoder()
        
            do {
                guard let data = data else {
                    return
                }
                let res = try decoder.decode([Category].self, from: data)
                completion(res)
            } catch {
                print(error.localizedDescription)
            }
        })

        task.resume()
        
    }
    
}
