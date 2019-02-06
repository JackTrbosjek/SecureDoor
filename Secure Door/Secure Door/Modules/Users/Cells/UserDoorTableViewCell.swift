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
    var switchAction: ((Bool) -> ()?)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        switchAction = nil
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        switchAction?(sender.isOn)
    }
    func configure(with item: UserDoorViewItem) {
        doorNameLabel.text = item.doorName
        allowedSwitch.setOn(item.isAllowed, animated: false)
        switchAction = item.switchAction
    }
}
