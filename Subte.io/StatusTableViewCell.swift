//
//  StatusTableViewCell.swift
//  Subte.io
//
//  Created by Mariano Molina on 2/10/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lineName: UILabel!
    @IBOutlet weak var lineContainer: UIView!
    @IBOutlet weak var lineStatusMessage: UILabel!
    @IBOutlet weak var lineFrequency: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
