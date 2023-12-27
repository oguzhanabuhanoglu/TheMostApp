//
//  ProfileHeaderCollectionReusableView.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "ProfileHeaderCollectionReusableView"
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.image = UIImage(named: "sisifos")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .label
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.text = "Oğuzhan Abuhanoğlu"
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .label
        label.font = UIFont(name: "Helvetica-Bold", size: 15)
        label.text = "abushanoglu"
        return label
    }()
    
    private let bioLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .label
        label.font = UIFont(name: "Helvetica-Bold", size: 13)
        label.text = "ME:"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioLabel)
    }
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let widht = frame.size.width
        let height = frame.size.height
        let size = frame.height / 1.7
                
        profileImageView.frame = CGRect(x: widht * 0.5 - (size) / 2, y: height * 0.3 - (size) / 2, width: size, height: size)
        profileImageView.layer.cornerRadius = size / 2
        
        nameLabel.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.67 - (height * 0.13) / 2, width: widht * 0.9, height: height * 0.13)
                
        usernameLabel.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.78 - (height * 0.07) / 2, width: widht * 0.9, height: height * 0.07)
        
        bioLabel.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.88 - (height * 0.13) / 2, width: widht * 0.9, height: height * 0.20)

        
    }
        
}
