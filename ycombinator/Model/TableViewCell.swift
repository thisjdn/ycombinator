//
//  TableViewCell.swift
//  ycombinator
//
//  Created by Jaden Hong on 2023-09-14.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
