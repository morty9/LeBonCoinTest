//
//  ItemViewModel.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemViewModel {
    
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    public var id: CLong {
        return item.id
    }
    
    public var category_id: Int {
        return item.category_id
    }
    
    public var title: String {
        return item.title
    }
    
    public var description: String {
        return item.description
    }
    
    public var price: Int {
        return item.price
    }
    
    public var images_url: ImageUrlViewModel {
        let images_url = ImageUrlViewModel(imageUrl: item.images_url)
        return images_url
    }
    
    public var creation_date: String {
        return item.creation_date
    }
    
    public var is_urgent: Bool {
        return item.is_urgent
    }
    
    public var siret: String? {
        return item.siret
    }
    
}
