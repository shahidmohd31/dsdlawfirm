//
//  MenuTableCell.swift
//  LawyerApp
//
//  Created by winklix on 30/11/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
