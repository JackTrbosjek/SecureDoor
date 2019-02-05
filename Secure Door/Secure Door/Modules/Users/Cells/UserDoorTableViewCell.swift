//
//  UserDoorTableViewCell.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 05/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import UIKit

class UserDoorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var doorNameLabel: UILabel!
    @IBOutlet weak var allowedSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: UserDoorViewItem) {
        doorNameLabel.text = item.doorName
        allowedSwitch.setOn(item.isAllowed, animated: false)
    }
}
