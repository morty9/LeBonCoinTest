//
//  ItemCellView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemCellView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Colors.grayColor
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let itemTitle: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 15, weight: .semibold))
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemUrgent: UrgentView = {
        let view = UrgentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let itemCategory: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 15, weight: .thin))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemPrice: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 17, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemDate: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 10, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        backgroundView.addSubview(itemImage)
        backgroundView.addSubview(mainStackView)
        
        setBackgroundView()
        setItemImage()
        setMainStackView()
    }
    
    private func setBackgroundView() {
        backgroundView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        backgroundView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        backgroundView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -5)
            .isActive = true
    }
    
    private func setItemImage() {
        itemImage
            .heightAnchor
            .constraint(equalTo: backgroundView.heightAnchor, constant: -40)
            .isActive = true
        itemImage
            .widthAnchor
            .constraint(equalTo: itemImage.heightAnchor, multiplier: 1.0/1.0)
            .isActive = true
        itemImage
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 16)
            .isActive = true
        itemImage
            .centerYAnchor
            .constraint(equalTo: backgroundView.centerYAnchor)
            .isActive = true
    }
    
    private func setMainStackView() {
        mainStackView.addArrangedSubview(itemTitle)
        mainStackView.addArrangedSubview(itemCategory)
        mainStackView.addArrangedSubview(itemUrgent)
        mainStackView.addArrangedSubview(itemPrice)
        mainStackView.addArrangedSubview(itemDate)
        
        mainStackView
            .bottomAnchor
            .constraint(equalTo: itemImage.bottomAnchor)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: itemImage.trailingAnchor, constant: 10)
            .isActive = true
        mainStackView
            .topAnchor
            .constraint(equalTo: itemImage.topAnchor)
            .isActive = true
        mainStackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -40)
            .isActive = true
        
        mainStackView.sizeToFit()
        mainStackView.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
