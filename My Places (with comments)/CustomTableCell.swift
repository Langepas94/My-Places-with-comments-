//
//  CustomTableCell.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 03.10.2022.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageOfPlace: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
