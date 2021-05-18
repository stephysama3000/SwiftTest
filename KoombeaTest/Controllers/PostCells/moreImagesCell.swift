//
//  moreImagesCell.swift
//  KoombeaTest
//
//  Created by Samaniego Villarroel Stephany Katherine on 5/16/21.
//

import UIKit

class moreImagesCell: UITableViewCell {

    
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imagenCollection: UICollectionView!
    var picturesCarousel = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "moreImagesCollectionViewCell", bundle: nil)
          imagenCollection.register(nib, forCellWithReuseIdentifier: "moreImagesCollectionViewCell")
          imagenCollection.dataSource = self
          imagenCollection.delegate = self
            selectionStyle = .none
        imagenCollection.frame = CGRect(x: imagenCollection.frame.origin.x, y: imagePost.frame.size.height + 120, width: imagenCollection.frame.size.width, height: imagenCollection.frame.size.height)

        self.contentView.addSubview(imagenCollection)
    }
 
}

extension moreImagesCell: UICollectionViewDataSource,UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesCarousel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreImagesCollectionViewCell", for: indexPath) as! moreImagesCollectionViewCell
        
        cell.imageCell.image = picturesCarousel[indexPath.row]
        return cell
    }
    
    
}
