//
//  ItemCellController.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemCellController: UITableViewCell {
    
    let cellView: ItemCellView = {
        let view = ItemCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        setCellView()
        
        backgroundColor = .clear
        accessoryType = .disclosureIndicator
    }
    
    private func setCellView() {
        cellView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        cellView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        cellView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        cellView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
