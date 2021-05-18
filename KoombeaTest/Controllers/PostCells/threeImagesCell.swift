//
//  threeImagesCell.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/16/21.
//

import UIKit

class threeImagesCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var imagePost1: UIImageView!
    @IBOutlet weak var imagePost2: UIImageView!
    @IBOutlet weak var imagePost3: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
