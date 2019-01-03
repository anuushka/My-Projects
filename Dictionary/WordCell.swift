//
//  WordCell.swift
//  Dictionary
//
//  Created by Anujin Baatartsogt on 7/25/18.
//  Copyright © 2018 Anujin Baatartsogt. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {
    @IBOutlet weak var jpnLabel: UILabel!
    
    @IBOutlet weak var monLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
