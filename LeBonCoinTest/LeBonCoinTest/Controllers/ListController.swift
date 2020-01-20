//
//  ListController.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ListController: UIViewController {
    
    let listView: ListView = {
        let view = ListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        view.addSubview(listView)
        listView
            .topAnchor
            .constraint(equalTo: view.topAnchor)
            .isActive = true
        listView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        listView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        listView
            .bottomAnchor
            .constraint(equalTo: view.bottomAnchor)
            .isActive = true
    }
    
}
