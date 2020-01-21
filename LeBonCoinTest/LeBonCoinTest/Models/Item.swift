//
//  Item.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class Item: Codable {
    
    public let id: CLong
    public let category_id: Int
    public let title: String
    public let description: String
    public let price: Int
    public let images_url: ImageUrl
    public let creation_date: String
    public let is_urgent: Bool
    public let siret: String?
    
    init(id: CLong, category_id: Int, title: String, description: String, price: Int, images_url: ImageUrl, creation_date: String, is_urgent: Bool, siret: String?) {
        self.id = id
        self.category_id = category_id
        self.title = title
        self.description = description
        self.price = price
        self.images_url = images_url
        self.creation_date = creation_date
        self.is_urgent = is_urgent
        self.siret = siret
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case category_id = "category_id"
        case title = "title"
        case description = "description"
        case price = "price"
        case images_url = "images_url"
        case creation_date = "creation_date"
        case is_urgent = "is_urgent"
        case siret = "siret"
    }
    
}
