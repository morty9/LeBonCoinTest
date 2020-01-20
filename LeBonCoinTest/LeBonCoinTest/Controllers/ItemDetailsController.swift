//
//  ItemDetailsController.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ItemDetailsController: UIViewController {
    
    let itemDetailsView: ItemDetailsView = {
        let view = ItemDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setView() {
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
    
}
