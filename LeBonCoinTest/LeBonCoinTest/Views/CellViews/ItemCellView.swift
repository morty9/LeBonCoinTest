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
    
    let itemImage: UIImageView = {
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
        stackView.addBackground(color: .cyan)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewTitle: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let itemTitle: UILabel = {
        let label = UILabel()
        label.text = "Pc portable hp elitebook 820 g1 core i5 4 go ram 250 go hdd"
        label.font = .some(.systemFont(ofSize: 15, weight: .thin))
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
        label.text = "Test"
        label.font = .some(.systemFont(ofSize: 15, weight: .thin))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemPrice: UILabel = {
        let label = UILabel()
        label.text = "12.99€"
        label.font = .some(.systemFont(ofSize: 17, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        backgroundView.addSubview(itemImage)
        backgroundView.addSubview(mainStackView)
        backgroundView.addSubview(itemPrice)
        
        setBackgroundView()
        setItemImage()
        setMainStackView()
        setTitleStackView()
        setItemPrice()
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
            .constraint(equalToConstant: 140)
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
        mainStackView.addArrangedSubview(stackViewTitle)
        mainStackView.addArrangedSubview(itemCategory)
        
        mainStackView
            .centerYAnchor
            .constraint(equalTo: backgroundView.centerYAnchor)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: itemImage.trailingAnchor, constant: 10)
            .isActive = true
    }
    
    private func setTitleStackView() {
        stackViewTitle.addArrangedSubview(itemTitle)
        stackViewTitle.addArrangedSubview(itemUrgent)
    }
    
    private func setItemPrice() {
        itemPrice
            .centerYAnchor
            .constraint(equalTo: backgroundView.centerYAnchor)
            .isActive = true
        itemPrice
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -40)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
