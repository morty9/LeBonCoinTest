//
//  ImageUrlViewModel.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ImageUrlViewModel {
    
    private let imageUrl: ImageUrl
    
    init(imageUrl: ImageUrl) {
        self.imageUrl = imageUrl
    }
    
    public var small: String? {
        return imageUrl.small!
    }
    
    public var getSmall: UIImage? {
        let imageView = UIImageView()
        imageView.load(url: URL(string: imageUrl.small!)!)
        return imageView.image
    }
    
    public var thumb: String? {
        return imageUrl.thumb!
    }
    
}
