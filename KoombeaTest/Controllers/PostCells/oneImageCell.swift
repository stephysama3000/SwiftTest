//
//  oneImageCell.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/16/21.
//

import UIKit

class oneImageCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
