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
        
        tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
//        tableView.rowHeight = 64
        tableView.tableHeaderView = headerView
        
       


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear method called")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // If the triggered segue is the "showItem" segue
        switch segue.identifier {
            case "showItem"?:
            // Figure out which row was just tapped
            if (tableView.indexPathForSelectedRow?.row) != nil {
            // Get the item associated with this row and pass it along
//                _ = itemStore.items[row]
                let detailViewController = segue.destination as! DetailViewController
//                detailViewController.item = item
                detailViewController.fixedViewTwo.backgroundColor = .systemPink
                detailViewController.flexibleViewOne.backgroundColor = .green
            }
            default:
            preconditionFailure("Unexpected segue identifier.")
        }
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
        
        cell.layer.cornerRadius = 10
        
        
        

   
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 6

            let maskLayer = CALayer()
            maskLayer.cornerRadius = 10    //if you want round edges
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
            cell.layer.mask = maskLayer
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.items.count
    }
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    
    
    
   
}

func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    return dateFormatter.string(from: date)
}
