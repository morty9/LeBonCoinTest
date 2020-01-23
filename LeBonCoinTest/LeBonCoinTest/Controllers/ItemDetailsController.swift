//
//  ItemDetailsController.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemDetailsController: UIViewController {
    
    let noItemView: NoItemView = {
        let view = NoItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemDetailsView: ItemDetailsView = {
        let view = ItemDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var item: Item?
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.darkWhite
        
        /// If there is no item display a specific "empty view"
        if (item != nil) {
            setView()
            setData()
        } else {
            setNoItemSelected()
        }
    }
    
    private func setData() {
        guard
            let item = item,
            let category = category else {
                return
        }
        
        if let images_url_small = item.images_url.small {
            itemDetailsView.itemImage.load(url: URL(string: images_url_small)!)
        } else {
            itemDetailsView.itemImage.image = #imageLiteral(resourceName: "picture-64")
            itemDetailsView.itemImage.contentMode = .center
        }
        
        itemDetailsView.itemTitle.text = item.title
        itemDetailsView.priceView.labelRight.text = "\(item.price)€"
        itemDetailsView.descriptionView.textView.text = item.description
        itemDetailsView.categoryTagView.label.text = category.name
        itemDetailsView.dateTagView.label.text = item.creation_date.toDateString(format: .dateFR)
    }
    
    private func setView() {
        navigationItem.titleView = itemDetailsView.navBarTitle
        navigationController?.navigationBar.tintColor = .black
        
        view.addSubview(itemDetailsView)
        itemDetailsView
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        itemDetailsView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        itemDetailsView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        itemDetailsView
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor)
            .isActive = true
    }
    
    private func setNoItemSelected() {
        navigationItem.titleView = itemDetailsView.navBarTitle
        navigationController?.navigationBar.tintColor = .black
        
        view.addSubview(noItemView)
        noItemView
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        noItemView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        noItemView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        noItemView
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor)
            .isActive = true
    }
    
}
