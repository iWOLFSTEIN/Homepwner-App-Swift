//
//  TableViewCell.swift
//  Homepwner
//
//  Created by BrainX Technologies on 17/04/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state

    }
    
    override var canBecomeFirstResponder: Bool {
            return true
        }
    
//    let margin: CGFloat = 16 // adjust the margin value as needed
//
//     // Initialize the cell with a reuseIdentifier
//     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//       super.init(style: style, reuseIdentifier: reuseIdentifier)
//       
//       // Set the cell's background color
//       backgroundColor = .white
//       
//       // Add a margin to the left and right edges of the cell's content view
//       contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin).isActive = true
//       contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin).isActive = true
//     }
//
//     // Required initializer, not implemented
//     required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
////       fatalError("init(coder:) has not been implemented")
//         
//     }
//    
}
