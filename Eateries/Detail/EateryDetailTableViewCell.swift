//
//  EateryDetailTableViewCell.swift
//  Eateries
//
//  Created by Владислав Варфоломеев on 18.04.2018.
//  Copyright © 2018 Владислав Варфоломеев. All rights reserved.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
