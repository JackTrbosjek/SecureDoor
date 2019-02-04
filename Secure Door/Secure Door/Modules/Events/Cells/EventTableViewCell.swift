//
//  EventTableViewCell.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright © 2019 Jakov. All rights reserved.
//

import Foundation
import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: EventViewItemInterface) {
        eventTextLabel.text = item.eventText
    }
}
