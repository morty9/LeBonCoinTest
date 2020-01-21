//
//  FilterView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class FilterView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.darkWhite
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = Strings.filter_label.localized
        label.font = .some(.systemFont(ofSize: 16, weight: .semibold))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Enfants"
        label.font = .some(.systemFont(ofSize: 16, weight: .regular))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        button.addTarget(self, action: #selector(ListController.removeFilter), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(mainStackView)
        
        setMainStackView()
        setStackView()
        setDeleteFilterButton()
    }
    
    private func setBackgroundView() {
        backgroundView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
        backgroundView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        backgroundView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
    }
    
    private func setMainStackView() {
        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(stackView)
        
        mainStackView
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor, constant: 10)
            .isActive = true
        mainStackView
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 16)
            .isActive = true
        mainStackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -16)
            .isActive = true
    }
    
    private func setStackView() {
        stackView.addArrangedSubview(categoryLabel)
        stackView.addArrangedSubview(deleteFilterButton)
    }
    
    private func setDeleteFilterButton() {
        deleteFilterButton
            .widthAnchor
            .constraint(equalTo: deleteFilterButton.heightAnchor, multiplier: 1.0/1.0)
            .isActive = true
        deleteFilterButton.contentEdgeInsets = UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
