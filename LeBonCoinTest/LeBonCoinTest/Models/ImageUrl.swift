//
//  ImageUrls.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ImageUrl: Codable {
    
    public let small: String
    public let thumb: String
    
    init(small: String, thumb: String) {
        self.small = small
        self.thumb = thumb
    }
    
    enum CodingKeys: String, CodingKey {
        case small = "small"
        case thumb = "thumb"
    }
    
}
