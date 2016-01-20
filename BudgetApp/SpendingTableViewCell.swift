//
//  SpendingTableViewCell.swift
//  BudgetApp
//
//  Created by Alexander on 12.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import UIKit

class SpendingTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel : UILabel?
    @IBOutlet var amountLabel : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
