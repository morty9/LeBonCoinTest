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
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let filterView: FilterView = {
        let view = FilterView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.register(ItemCellController.self, forCellReuseIdentifier: "ItemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let categoryPickerView: PickerView = {
        let view = PickerView()
        view.button.addTarget(self, action: #selector(ListController.launchFilter), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.darkWhite
        
        setFilterView()
        
        addSubview(mainStackView)
        setMainStackView()
    }
    
    private func setMainStackView() {
        mainStackView.addArrangedSubview(filterView)
        mainStackView.addArrangedSubview(itemsTableView)
        
        mainStackView
            .topAnchor
            .constraint(equalTo: topAnchor)
            .isActive = true
        mainStackView
            .leadingAnchor
            .constraint(equalTo: leadingAnchor)
            .isActive = true
        mainStackView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        mainStackView
            .bottomAnchor
            .constraint(equalTo: bottomAnchor)
            .isActive = true
    }
    
    func setFilterView() {
        filterView
            .heightAnchor
            .constraint(equalToConstant: 70)
            .isActive = true
    }
    
    func removeFilterView() {
        filterView.isHidden = true
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
    
    func setCategoryPickerView() {
        addSubview(categoryPickerView)
        
        categoryPickerView
            .topAnchor
            .constraint(equalTo: itemsTableView.topAnchor)
            .isActive = true
        categoryPickerView
            .trailingAnchor
            .constraint(equalTo: trailingAnchor)
            .isActive = true
        categoryPickerView
            .widthAnchor
            .constraint(equalTo: widthAnchor)
            .isActive = true
    }
    
    func removeCategoryPickerView()  {
        categoryPickerView.removeFromSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
