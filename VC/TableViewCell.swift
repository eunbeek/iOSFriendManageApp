//
//  TableViewCell.swift
//  Midterm_Test
//
//  Created by user182260 on 11/6/20.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

// EK : This Class is used for TableViewCell in FriendList
class TableViewCell: UITableViewCell {

    // EK : Custom Cell component
    @IBOutlet weak var lNameLabel : UILabel!
    @IBOutlet weak var imagePrint : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
