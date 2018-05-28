//
//  ClassTableViewCell.swift
//  HooStudiez
//
//  Created by Abbas, Aadil (aa4zw) on 4/12/18.
//  Copyright © 2018 Abbas, Aadil (aa4zw). All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var dptNumber: UILabel!
    @IBOutlet weak var professor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
