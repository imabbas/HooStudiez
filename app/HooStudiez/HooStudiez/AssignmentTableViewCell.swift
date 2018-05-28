//
//  AssignmentTableViewCell.swift
//  HooStudiez
//
//  Created by Aadil Abbas on 4/13/18.
//  Copyright © 2018 Abbas, Aadil (aa4zw). All rights reserved.
//

import UIKit

class AssignmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var assignmentNameLabel: UILabel!
    @IBOutlet weak var assignmentClassLabel: UILabel!
    @IBOutlet weak var assignmentDueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
