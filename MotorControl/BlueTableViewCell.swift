//
//  BlueTableViewCell.swift
//  MotorControl
//
//  Created by ujs on 7/24/18.
//  Copyright © 2018 ujs. All rights reserved.
//

import UIKit

class BlueTableViewCell: UITableViewCell {
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var label_rssi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
