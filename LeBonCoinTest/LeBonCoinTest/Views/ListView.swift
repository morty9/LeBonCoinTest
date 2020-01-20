//
//  ListView.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    let navBarTitle: UILabel = {
        let label = UILabel()
        label.text = Strings.nav_bar_title_list_controller.localized
        label.font = .some(.systemFont(ofSize: 18, weight: .semibold))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.register(ItemCellController.self, forCellReuseIdentifier: "ItemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        addSubview(itemsTableView)
        setItemTableView()
    }
    
    private func setItemTableView() {
        itemsTableView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        itemsTableView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        itemsTableView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        itemsTableView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
