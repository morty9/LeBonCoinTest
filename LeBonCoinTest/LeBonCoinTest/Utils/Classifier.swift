//
//  Classifier.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemDateClassifier {
    
    /// Sort items of the given array by date
    /// - Parameter items: items to sort
    func sortItemsByDate(items: [Item]) -> [Item] {
        let sorted =
            items.sorted(by: { $0.creation_date.compare($1.creation_date) == .orderedDescending })

        return sorted
    }
    
}

class ItemStatusClassifier {
    
    /// Sort items of the given array by status (urgent status priorised)
    /// - Parameter items: items to sort
    func sortItemsByStatus(items: [Item]) -> [Item] {
        let sorted = items.sorted { $0.is_urgent && !$1.is_urgent}
        
        return sorted
    }
    
}

class ItemCategoryClassifier {
    
    /// Sort items of the given array by category, get only the item with the given category
    /// - Parameters:
    ///   - items: items to sort
    ///   - category: category given
    func sortItemsByCategory(items: [Item], category: Category) -> [Item] {
        let filtered = items.filter { $0.category_id == category.id }.map { $0 }
        
        return filtered
    }
    
}
