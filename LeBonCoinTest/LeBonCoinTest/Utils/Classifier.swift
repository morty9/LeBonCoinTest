//
//  Classifier.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemDateClassifier {
    
    func sortItemsByDate(items: [Item]) -> [Item] {
        let sorted =
            items.sorted(by: { $0.creation_date.compare($1.creation_date) == .orderedDescending })

        return sorted
    }
    
}

class ItemStatusClassifier {
    
    func sortItemsByStatus(items: [Item]) -> [Item] {
        let sorted = items.sorted { $0.is_urgent && !$1.is_urgent}
        
        return sorted
    }
    
}

class ItemCategoryClassifier {
    
    func sortItemsByCategory(items: [Item], category: Category) -> [Item] {
        let filtered = items.filter { $0.category_id == category.id }.map { $0 }
        
        return filtered
    }
    
}
