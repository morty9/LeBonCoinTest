//
//  TagView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class TagView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .some(.systemFont(ofSize: 12, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(label)
        setLabel()
    }
    
    private func setBackgroundView() {
        backgroundView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        backgroundView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        backgroundView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setLabel() {
        label
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor, constant: 8)
            .isActive = true
        label
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 10)
            .isActive = true
        label
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
            .isActive = true
        label
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -8)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
