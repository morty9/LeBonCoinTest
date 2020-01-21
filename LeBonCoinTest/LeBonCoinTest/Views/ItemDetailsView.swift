//
//  ItemDetailsView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemDetailsView: UIView {
    
    let navBarTitle: UILabel = {
        let label = UILabel()
        label.text = Strings.nav_bar_title_details_controller.localized
        label.font = .some(.systemFont(ofSize: 18, weight: .semibold))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.backgroundColor = Colors.darkWhite
        sv.scrollsToTop = true
        sv.alwaysBounceHorizontal = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addBackground(color: .white)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "picture-gray")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        addSubview(scrollView)
        setScrollView()
        scrollView.addSubview(backgroundView)
        setBackgroundView()
    }
    
    private func setScrollView() {
        scrollView
            .centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
        scrollView
            .widthAnchor
            .constraint(equalTo: widthAnchor)
            .isActive = true
        scrollView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        scrollView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setBackgroundView() {
        backgroundView
            .centerXAnchor
            .constraint(equalTo: scrollView.centerXAnchor)
            .isActive = true
        backgroundView
            .widthAnchor
            .constraint(equalTo: scrollView.widthAnchor)
            .isActive = true
        backgroundView
            .topAnchor
            .constraint(equalTo: scrollView.topAnchor)
            .isActive = true
        backgroundView
            .bottomAnchor
            .constraint(equalTo: scrollView.bottomAnchor)
            .isActive = true
    }
    
    private func setMainStackView() {
        mainStackView.addArrangedSubview(itemImage)
        //mainStackView.addArrangedSubview(mainDataStackView)
        
        mainStackView
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor, constant: 10)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        mainStackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
        mainStackView.sizeToFit()
        mainStackView.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
