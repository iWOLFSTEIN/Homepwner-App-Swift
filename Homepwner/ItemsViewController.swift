//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by BrainX Technologies on 14/04/2023.
//

import Foundation
import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 5)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
//        tableView.rowHeight = 64
        tableView.tableHeaderView = headerView
//        tableView.tableHeaderView = tableView.subviews.first!.subviews.first as! UIView
//        print(tableView.subviews.first?.subviews)

    }
    
    @IBAction func editItem(_ sender: Any) {
    }
    @IBAction func addItem(_ sender: UIButton) {
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = itemStore.items[indexPath.row]
        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "\(item.price)$"
        cell.nameLabel.text = item.name
        cell.creationDateLabel.text = "Creation Date: " + formatDate(item.dateOfCreation)
        cell.priceLabel.text = String(item.price) + "$"
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.items.count
    }
}

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.string(from: date)
}
