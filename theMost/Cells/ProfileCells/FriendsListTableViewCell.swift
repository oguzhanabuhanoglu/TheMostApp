//
//  FriendsListTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 28.12.2023.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsListTableViewCell"

    private let profileImageView : UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.backgroundColor = .tertiaryLabel
        image.image = UIImage(named: "sisifos")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.textAlignment = .left
        label.textColor = .label
        label.text = "Hakanka"
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        return label
    }()
    
    private let namelabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.text = "Hakan Karaaslan"
        label.font = UIFont(name: "Helvetica", size: 15)
        return label
    }()
    
    private let deleteButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark.circle"), for: UIControl.State.normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(namelabel)
        contentView.addSubview(deleteButton)
        
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widht = contentView.frame.size.width
        let height = contentView.frame.size.height
        
        let size = height - 2
        profileImageView.frame = CGRect(x: 3, y: 1, width: size, height: size)
        profileImageView.layer.cornerRadius = size / 2
        
        usernameLabel.frame = CGRect(x: widht * 0.5 - (widht * 0.6) / 2, y: 4, width: widht * 0.6, height: (height / 2) - 8)
        namelabel.frame = CGRect(x: widht * 0.5 - (widht * 0.6) / 2, y: (height / 2) , width: widht * 0.6, height: (height / 2) - 8)
        
        let size3 = height / 2
        deleteButton.frame = CGRect(x: widht - size3 - 12, y: (height - size3) / 2, width: size3, height: size3)
        
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        usernameLabel.text = nil
        namelabel.text = nil
        
    }
    
    @objc func didTapDeleteButton() {
        //update database
    }
    
    
    
    
}
