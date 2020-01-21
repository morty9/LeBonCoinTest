//
//  CategoryViewModel.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class CategoryViewModel {
    
    private let category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    public var id: Int {
        return category.id
    }
    
    public var name: String {
        return category.name
    }
    
}
