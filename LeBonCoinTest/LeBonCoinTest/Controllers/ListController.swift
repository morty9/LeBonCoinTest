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
    let apiItemHandler = APIItemHandler()
    let apiCategoryHandler = APICategoryHandler()
    let itemCategoryClassifier = ItemCategoryClassifier()
    
    let listView: ListView = {
        let view = ListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var filterButton: UIBarButtonItem = {
        let image = #imageLiteral(resourceName: "filter-plain").withRenderingMode(.alwaysOriginal)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(openFilter))
        return barButtonItem
    }()
    
    var filterCategory: Category?
    var categories: [Category] = [] {
        didSet {
            DispatchQueue.main.async {
                self.listView.categoryPickerView.pickerView.reloadAllComponents()
            }
        }
    }
    var itemArray: [Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.listView.itemsTableView.reloadData()
            }
        }
    }
    
    var itemArrayFiltered: [Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.listView.itemsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        setView()
        setTableViewDelegate()
        setPickerViewDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        apiCategoryHandler.getCategories { (res) in
            self.categories = res
            self.getItems()
        }
    }
    
    private func getItems() {
        apiItemHandler.getItems { (res) in
            self.itemArray = res
        }
    }
    
    private func setTableViewDelegate() {
        listView.itemsTableView.delegate = self
        listView.itemsTableView.dataSource = self
    }
    
    private func setPickerViewDelegate() {
        listView.categoryPickerView.pickerView.delegate = self
        listView.categoryPickerView.pickerView.dataSource = self
    }
    
    private func setView() {
        navigationItem.titleView = listView.navBarTitle
        navigationItem.rightBarButtonItem = filterButton
        
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
    
    @objc private func openFilter() {
        listView.setCategoryPickerView()
    }
    
    @objc func launchFilter() {
        guard let filterCategory = filterCategory else {
            return
        }
        
        itemArrayFiltered = itemCategoryClassifier.sortItemsByCategory(items: itemArray, category: filterCategory)
        listView.filterView.categoryLabel.text = filterCategory.name
        listView.filterView.isHidden = false
        listView.removeCategoryPickerView()
    }
    
    @objc func removeFilter() {
        listView.removeFilterView()
        itemArrayFiltered.removeAll()
        filterCategory = nil
    }
    
    override func viewWillLayoutSubviews() {
        listView.mainStackView.subviews.forEach {
            $0.sizeToFit()
            $0.layoutIfNeeded()
        }
    }
    
}

extension ListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (filterCategory != nil) {
            return itemArrayFiltered.count
        }
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemCellController
        
        let item: Item = filterCategory != nil ? itemArrayFiltered[indexPath.row] : itemArray[indexPath.row]
        
        if let images_url_small = item.images_url.small {
            cell.cellView.itemImage.load(url: URL(string: images_url_small)!)
        } else {
            cell.cellView.itemImage.image = #imageLiteral(resourceName: "picture-64")
            cell.cellView.itemImage.contentMode = .center
        }
        
        cell.cellView.itemTitle.text = item.title
        cell.cellView.itemUrgent.isHidden = !item.is_urgent
        cell.cellView.itemPrice.text = "\(item.price)€"
        
        let category = categories.filter { $0.id == item.category_id }.map { $0 }[0].name
        cell.cellView.itemCategory.text = category
        cell.cellView.itemDate.text = item.creation_date.toDateString(format: .dateFR)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailsController = ItemDetailsController()
        let item: Item = filterCategory != nil ? itemArrayFiltered[indexPath.row] : itemArray[indexPath.row]
        itemDetailsController.item = item
        itemDetailsController.category = categories.filter { $0.id == item.category_id }.map { $0 }[0]
        navigationController?.pushViewController(itemDetailsController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension ListController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        filterCategory = categories[row]
    }
}

