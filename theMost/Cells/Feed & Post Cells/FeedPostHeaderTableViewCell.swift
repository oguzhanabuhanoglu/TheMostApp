//
//  FeedPostHeaderTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import UIKit

protocol FeedPostHeaderTableViewCellDelegate : AnyObject {
    func didTapMostButton()
}

class FeedPostHeaderTableViewCell: UITableViewCell {

    static let identifier = "FeedPostHeaderTableViewCell"
    
    weak var delegate: FeedPostHeaderTableViewCellDelegate?
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 1
        label.backgroundColor = .systemBackground
        label.font = .systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        return label
    }()
    
    private let moreButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: UIControl.State.normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(moreButton)
        
        moreButton.addTarget(self, action: #selector(didTapMoreButton), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: User){
        profileImageView.image = UIImage(named: "sisifos")
        //profileImageView.sd_setImage(with: model.profilePhoto, completed: nil)
        
        usernameLabel.text = "HakanKa"
        //usernameLabel.text = model.username
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        usernameLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widht = contentView.frame.size.width
        let height = contentView.frame.size.height
        
        let size = height - 4
        profileImageView.frame = CGRect(x: 2, y: 2, width: size, height: size)
        profileImageView.layer.cornerRadius = size / 2
        
        usernameLabel.frame = CGRect(x: widht * 0.51 - (widht * 0.7) / 2, y: 2, width: widht * 0.7, height: size)
        
        moreButton.frame = CGRect(x: widht - size - 3, y: 2, width: size, height: size)
    }
    
    @objc func didTapMoreButton() {
        delegate?.didTapMostButton()
    }

}
