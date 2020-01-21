//
//  Parsers.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemParser {
    
    func parseToItemArray(data: Data, completion: (_ result: [Item]) -> Void) {
        let decoder = JSONDecoder()
        
        do {
            let res = try decoder.decode([Item].self, from: data)
            completion(res)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

class CategoryParser {
    
    func parseToCategoryArray(data: Data, completion: (_ result: [Category]) -> Void) {
        let decoder = JSONDecoder()
        
        do {
            let res = try decoder.decode([Category].self, from: data)
            completion(res)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
