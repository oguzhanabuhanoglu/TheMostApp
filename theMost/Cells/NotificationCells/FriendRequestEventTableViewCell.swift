//
//  AddFriendEventTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit

protocol FriendRequestEventTableViewCellDelegate : AnyObject {
    func didTapAcceptButton(model: UserNotification)
    func didTapDeclineButton()
}

class FriendRequestEventTableViewCell: UITableViewCell {

    static let identifier = "AddFriendEventTableViewCell"
    
    weak var delegate : FriendRequestEventTableViewCellDelegate?
    
    private var model : UserNotification?
    
    private let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sisifos")
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvetica", size: 15)
        label.text = "Joe sana arkadaşlık istedi gönderdi"
        return label
    }()
    
    private let acceptButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "checkmark.circle"), for: UIControl.State.normal)
        //button.setTitle("accept", for: UIControl.State.normal)
        button.tintColor = .label
        return button
    }()
    
    private let declineButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark.circle"), for: UIControl.State.normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        addSubview(profileImage)
        addSubview(label)
        addSubview(declineButton)
        addSubview(acceptButton)
        
        declineButton.addTarget(self, action: #selector(didTapDeclineButton), for: UIControl.Event.touchUpInside)
        acceptButton.addTarget(self, action: #selector(didTapAcceptButton), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widht = contentView.frame.size.width
        let height = contentView.frame.size.height
        
        let size = height - 6
        profileImage.frame = CGRect(x: 3, y: 3, width: size, height: size)
        profileImage.layer.cornerRadius = size / 2
        
        let size2 = height - 4
        label.frame = CGRect(x: widht * 0.52  - (widht * 0.7) / 2, y: 2, width: widht * 0.5, height: size2)
        
        let size3 = height / 2
        declineButton.frame = CGRect(x: widht - size3 - 12, y: (height - size3) / 2, width: size3, height: size3)
        
        acceptButton.frame = CGRect(x: widht - (size3 * 2) - 30, y: (height - size3) / 2, width: size3, height: size3)
        //acceptButton.frame = CGRect(x: widht * 0.68, y: height / 2 - (height * 0.3), width: widht * 0.2, height: height * 0.6)
        /*acceptButton.layer.borderWidth = 1
        acceptButton.layer.borderColor = UIColor.white.cgColor
        acceptButton.layer.cornerRadius = 20*/
        
    }
    
    override func prepareForReuse() {
        profileImage.image = nil
        label.text = nil
    }
    

    public func configure(with model : UserNotification) {
        self.model = model
        
        switch model.type {
        case .like(_):
            break
        case .friendRequest:
            //configure buttons
            break
        }
    }
    
    
    @objc func didTapDeclineButton() {
        guard let model = model else {
            return
        }
        delegate?.didTapDeclineButton()
    }
    
    @objc func didTapAcceptButton() {
        guard let model = model else {
            return
        }
        delegate?.didTapAcceptButton(model: model)
        
    }
    
    
    
    

}
