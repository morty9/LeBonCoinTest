//
//  NoItemView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 23/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class NoItemView: UIView {
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "select_item")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = Strings.no_item_label.localized
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.darkBlue
        label.font = .some(.systemFont(ofSize: 18, weight: .semibold))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        addSubview(image)
        addSubview(label)
        
        setImageView()
        setLabelView()
        
    }
    
    private func setImageView() {
        image
            .centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
        image
            .centerYAnchor
            .constraint(equalTo: centerYAnchor, constant: -10)
            .isActive = true
    }
    
    private func setLabelView() {
        label
            .topAnchor
            .constraint(equalTo: image.bottomAnchor, constant: 10)
            .isActive = true
        label
            .centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
