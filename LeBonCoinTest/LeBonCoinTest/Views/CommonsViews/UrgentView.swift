//
//  UrgentView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class UrgentView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let urgentTitle: UILabel = {
        let label = UILabel()
        label.text = Strings.is_urgent.localized
        label.textColor = Colors.yellow_urgent
        label.font = .some(.systemFont(ofSize: 13, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        setStackView()
        setStarImage()
    }
    
    private func setStackView() {
        stackView.addArrangedSubview(starImage)
        stackView.addArrangedSubview(urgentTitle)
        
        stackView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        stackView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        stackView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        stackView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setStarImage() {
        starImage
            .heightAnchor
            .constraint(equalToConstant: 15)
            .isActive = true
        starImage
            .widthAnchor
            .constraint(equalTo: starImage.heightAnchor, multiplier: 1.0/1.0)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
