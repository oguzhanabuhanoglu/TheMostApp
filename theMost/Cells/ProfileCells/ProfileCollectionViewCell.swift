//
//  ProfileCollectionViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import UIKit
import SDWebImage

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileCollectionViewCell"
    
    private let photoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    // this func gonna get real thumbnail images for cells
    public func conifgure(with model : UserPosts) {
        let url = model.thumbnailImage
        photoImageView.sd_setImage(with: url)
    }
    
    // this func just for testing about how images looking like in cell
    public func configure(debug imageName: String){
        photoImageView.image = (UIImage(named: imageName))
    }
    
}
