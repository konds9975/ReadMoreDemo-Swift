//
//  TableViewCell.swift
//  ReadMoreDemo
//
//  Created by Kondiram Sonawane on 3/17/18.
//  Copyright © 2018 Kondiram Sonawane. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labl: ExpandableLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
