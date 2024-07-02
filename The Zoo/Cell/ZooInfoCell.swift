//
//  ZooInfoCell.swift
//  The Zoo
//
//  Created by Ayaz Ayazov on 26.06.24.
//

import UIKit

class ZooInfoCell: UITableViewCell {
    
    @IBOutlet weak var zooNameLabel: UILabel!
    @IBOutlet weak var zooCountryLabel: UILabel!
    @IBOutlet weak var zooInfoTextView: UITextView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
