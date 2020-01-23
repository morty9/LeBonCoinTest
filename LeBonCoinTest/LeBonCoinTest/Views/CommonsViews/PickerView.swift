//
//  PickerView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 21/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class PickerView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.darkWhite
        view.layer.cornerRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pickerView: UIPickerView = {
        let view = UIPickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsSelectionIndicator = true
        view.tintColor = Colors.darkBlue
        return view
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 3
        button.backgroundColor = Colors.darkBlue
        button.setTitle(Strings.picker_view_button_title.localized, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundView)
        setBackgroundView()
        
        backgroundView.addSubview(pickerView)
        backgroundView.addSubview(button)
        
        setPickerView()
        setButton()
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
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    private func setPickerView() {
        pickerView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: 10)
            .isActive = true
        pickerView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -10)
            .isActive = true
        pickerView
            .topAnchor
            .constraint(equalTo: topAnchor, constant: 10)
            .isActive = true
        pickerView
            .bottomAnchor
            .constraint(equalTo: button.topAnchor, constant: 10)
            .isActive = true
        pickerView
            .heightAnchor
            .constraint(equalToConstant: 100)
            .isActive = true
    }
    
    private func setButton() {
        button
            .topAnchor
            .constraint(equalTo: pickerView.bottomAnchor, constant: 10)
            .isActive = true
        button
            .leadingAnchor
            .constraint(equalTo: backgroundView.leadingAnchor, constant: 50)
            .isActive = true
        button
            .trailingAnchor
            .constraint(equalTo: backgroundView.trailingAnchor, constant: -50)
            .isActive = true
        button
            .bottomAnchor
            .constraint(equalTo: backgroundView.bottomAnchor, constant: -10)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
