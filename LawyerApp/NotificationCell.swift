//
//  NotificationCell.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 04/08/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet var lblStatusText: UILabel!
    @IBOutlet var lblMessageText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblMessageText.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblMessageText.numberOfLines = 0
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
