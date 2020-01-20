//
//  ListController.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

class ListController: UIViewController {
    
    let cellId = "ItemCell"
    
    let listView: ListView = {
        let view = ListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTableViewDelegate()
    }
    
    private func setTableViewDelegate() {
        listView.itemsTableView.delegate = self
        listView.itemsTableView.dataSource = self
    }
    
    private func setView() {
        self.navigationItem.titleView = listView.navBarTitle
        
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

extension ListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemCellController
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailsController = ItemDetailsController()
        navigationController?.pushViewController(itemDetailsController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
}

