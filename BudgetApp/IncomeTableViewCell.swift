//
//  IncomeTableViewCell.swift
//  BudgetApp
//
//  Created by Alexander on 31.05.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel : UILabel?
    @IBOutlet var amountLabel : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
