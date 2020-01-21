//
//  WebServices.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class APIItemHandler {
    
    let itemParser = ItemParser()
    let itemDateClassifier = ItemDateClassifier()
    let itemStatusClassifier = ItemStatusClassifier()
    
    func getItems(completion: @escaping (_ result: [Item]) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data else {
                return
            }
            
            self.itemParser.parseToItemArray(data: data) { (res) in
                let sortedByDate = self.itemDateClassifier.sortItemsByDate(items: res)
                let sortedByStatus = self.itemStatusClassifier.sortItemsByStatus(items: sortedByDate)
                completion(sortedByStatus)
            }
        })

        task.resume()
        
    }
    
}

class APICategoryHandler {
    
    let categoryParser = CategoryParser()
    
    func getCategories(completion: @escaping (_ result: [Category]) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data else {
                return
            }
        
            self.categoryParser.parseToCategoryArray(data: data) { (res) in
                completion(res)
            }
        })

        task.resume()
        
    }
    
}
