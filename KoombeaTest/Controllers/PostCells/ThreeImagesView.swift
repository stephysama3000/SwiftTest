//
//  ThreeImagesView.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/15/21.
//

import UIKit

class ThreeImagesView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var imagePost1: UIImageView!
    @IBOutlet weak var imagePost2: UIImageView!
    @IBOutlet weak var imagePost3: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("ThreeImages", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        viewFromXib.frame = CGRect(x: 0, y: 0, width: viewFromXib.frame.width, height: viewFromXib.frame.height)
        addSubview(viewFromXib)
    }

    /*override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        if subviews.count == 0 {
            commonInit()
        }
        
    }
    
    private func commonInit() {
        
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("ThreeImages", owner: self, options: nil)
        addSubview(contentView)
        
        self.userProfilePic.makeRounded()
    }*/
}
