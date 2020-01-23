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
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    let urgentView: UrgentView = {
        let view = UrgentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backgroundTitle: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemTitle: UILabel = {
        let label = UILabel()
        label.font = .some(.systemFont(ofSize: 18, weight: .semibold))
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let priceView: LineLabelView = {
        let view = LineLabelView()
        view.labelLeft.text = Strings.price_label.localized
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionView: DescriptionView = {
        let view = DescriptionView()
        view.labelTop.text = Strings.description_label.localized
        return view
    }()
    
    let siretView: LineLabelView = {
        let view = LineLabelView()
        view.labelLeft.text = Strings.siret_label.localized
        view.isHidden = true
        return view
    }()
    
    let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let categoryTagView: TagView = {
        let tagView = TagView()
        tagView.backgroundView.backgroundColor = Colors.darkBlue
        tagView.translatesAutoresizingMaskIntoConstraints = false
        return tagView
    }()
    
    let dateTagView: TagView = {
        let tagView = TagView()
        tagView.backgroundView.backgroundColor = Colors.lightBlue
        tagView.translatesAutoresizingMaskIntoConstraints = false
        return tagView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        addSubview(scrollView)
        setScrollView()
        scrollView.addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(mainStackView)
    
        setMainStackView()
        setItemImage()
        setTitleView()
        setPriceView()
        setDescriptionView()
        setSiretView()
        setTagStackView()
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
        mainStackView.addArrangedSubview(urgentView)
        mainStackView.addArrangedSubview(backgroundTitle)
        mainStackView.addArrangedSubview(priceView)
        mainStackView.addArrangedSubview(descriptionView)
        mainStackView.addArrangedSubview(siretView)
        mainStackView.addArrangedSubview(tagStackView)
        
        mainStackView
            .topAnchor
            .constraint(equalTo: backgroundView.topAnchor)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor)
            .isActive = true
        mainStackView
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor)
            .isActive = true
        mainStackView
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
            .isActive = true
        mainStackView.sizeToFit()
        mainStackView.layoutIfNeeded()
    }
    
    private func setItemImage() {
        itemImage
            .heightAnchor
            .constraint(equalToConstant: 240)
            .isActive = true
        itemImage
            .widthAnchor
            .constraint(equalTo: itemImage.heightAnchor, multiplier: 1.0/1.0)
            .isActive = true
        itemImage
            .topAnchor
            .constraint(equalTo: mainStackView.topAnchor, constant: 10)
            .isActive = true
    }
    
    private func setTitleView() {
        backgroundTitle.addSubview(itemTitle)
        
        backgroundTitle
            .leadingAnchor
            .constraint(equalTo: mainStackView.leadingAnchor)
            .isActive = true
        backgroundTitle
            .trailingAnchor
            .constraint(equalTo: mainStackView.trailingAnchor)
            .isActive = true
        backgroundTitle.sizeToFit()
        backgroundTitle.layoutIfNeeded()
        
        itemTitle
            .topAnchor
            .constraint(equalTo: backgroundTitle.topAnchor, constant: 10)
            .isActive = true
        itemTitle
            .leadingAnchor
            .constraint(equalTo: backgroundTitle.leadingAnchor, constant: 16)
            .isActive = true
        itemTitle
            .trailingAnchor
            .constraint(equalTo: backgroundTitle.trailingAnchor, constant: -16)
            .isActive = true
        itemTitle
            .bottomAnchor
            .constraint(equalTo: backgroundTitle.bottomAnchor, constant: -10)
            .isActive = true
    }
    
    private func setPriceView() {
        priceView
            .leadingAnchor
            .constraint(equalTo: mainStackView.leadingAnchor)
            .isActive = true
        priceView
            .trailingAnchor
            .constraint(equalTo: mainStackView.trailingAnchor)
            .isActive = true
    }
    
    private func setDescriptionView() {
        descriptionView
            .leadingAnchor
            .constraint(equalTo: mainStackView.leadingAnchor)
            .isActive = true
        descriptionView
            .trailingAnchor
            .constraint(equalTo: mainStackView.trailingAnchor)
            .isActive = true
        descriptionView.sizeToFit()
        descriptionView.layoutIfNeeded()
    }
    
    private func setSiretView() {
        siretView
            .leadingAnchor
            .constraint(equalTo: mainStackView.leadingAnchor)
            .isActive = true
        siretView
            .trailingAnchor
            .constraint(equalTo: mainStackView.trailingAnchor)
            .isActive = true
        siretView.sizeToFit()
        siretView.layoutIfNeeded()
    }
    
    private func setTagStackView() {
        tagStackView.addArrangedSubview(categoryTagView)
        tagStackView.addArrangedSubview(dateTagView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
