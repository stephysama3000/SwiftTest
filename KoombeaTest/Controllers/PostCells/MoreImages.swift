//
//  MoreImages.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/15/21.
//

import UIKit

@IBDesignable
class MoreImages: UIView {
    

    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var stackWView: UIStackView!
    @IBOutlet weak var stackMoreImg: UIStackView!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imagenCollection: UICollectionView!
    var picturesCarousel = [UIImage]()
    
    override init(frame: CGRect) {
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
        bundle.loadNibNamed("MoreImages", owner: self, options: nil)
        addSubview(stackMoreImg)
        addSubview(contentView)
        self.userProfilePic.makeRounded()
        initCollectionView()
    }
    
    private func initCollectionView() {
      let nib = UINib(nibName: "moreImagesCollectionViewCell", bundle: nil)
        imagenCollection.register(nib, forCellWithReuseIdentifier: "moreImagesCollectionViewCell")
        imagenCollection.dataSource = self
        imagenCollection.delegate = self
    }
}

extension MoreImages: UICollectionViewDataSource,UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesCarousel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreImagesCollectionViewCell", for: indexPath) as! moreImagesCollectionViewCell
        
        cell.imageCell.image = picturesCarousel[indexPath.row]
        return cell
    }
    
    
}
/* MoreImages: UIView, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var imagenCollection: UICollectionView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        let nibName = UINib(nibName: "moreImagesCollectionViewCell", bundle:nil)
        imagenCollection.register(nibName, forCellWithReuseIdentifier: "moreImagesCollectionViewCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func create(){
        let nibName = UINib(nibName: "moreImagesCollectionViewCell", bundle:nil)
        imagenCollection.register(nibName, forCellWithReuseIdentifier: "moreImagesCollectionViewCell")
    }
    
    private func commonInit(){
        
    }
    /*class func create() -> MoreImages {
            let nib = UINib(nibName: "MoreImages", bundle: nil)
            let view = nib.instantiate(withOwner: self, options: nil)[0] as? MoreImages

            //if you use xibs:
        
            view?.imagenCollection.register(UINib(nibName: "moreImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "moreImagesCollectionViewCell")
            view?.imagenCollection.dataSource = view
            view?.imagenCollection.delegate = view
            view?.imagenCollection.reloadData()
            return view!
        }*/
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moreImagesCollectionViewCell.identifier, for: indexPath) as! moreImagesCollectionViewCell
        
        cell.configure(with: UIImage(named: "pics135")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
    }
    
}
*/

