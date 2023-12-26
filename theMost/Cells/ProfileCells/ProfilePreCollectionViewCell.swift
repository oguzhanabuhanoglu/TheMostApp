//
//  ProfilePreCollectionViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import UIKit
import SDWebImage

class ProfilePreCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfilePreCollectionViewCell"
    
    private let prePhotoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(prePhotoImageView)
        contentView.layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prePhotoImageView.frame = contentView.bounds
    }
    
    // this func gonna get real thumbnail images for cells
    public func conifgure(with model : UserPosts) {
        let url = model.thumbnailImage
        prePhotoImageView.sd_setImage(with: url)
    }
    
    // this func just for testing about how images looking like in cell
    public func configure(debug imageName: String){
        prePhotoImageView.image = (UIImage(named: imageName))
    }
    
    
}
