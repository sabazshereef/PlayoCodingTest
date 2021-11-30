//
//  HeadlinesTableViewCell.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import UIKit

class HeadlinesTableViewCell: UITableViewCell {

    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
