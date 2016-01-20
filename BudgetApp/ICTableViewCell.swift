//
//  ICTableViewCell.swift
//  BudgetApp
//
//  Created by Alexander on 13.06.15.
//  Copyright (c) 2015 Alexander Vorontsov. All rights reserved.
//

import UIKit

class ICTableViewCell: UITableViewCell {
    
    @IBOutlet var name : UILabel?
    @IBOutlet var sumlabel : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
