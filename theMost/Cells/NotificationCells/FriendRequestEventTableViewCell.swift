//
//  AddFriendEventTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit

protocol FriendRequestEventTableViewCellDelegate : AnyObject {
    func didTapAcceptButton(model : UserNotification)
    func didTapDeclineButton()
}

class FriendRequestEventTableViewCell: UITableViewCell {

    static let identifier = "AddFriendEventTableViewCell"
    
    weak var delegate : FriendRequestEventTableViewCellDelegate?
    
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
        label.backgroundColor = .label
        label.numberOfLines = 2
        label.font = UIFont(name: "Helvelica", size: 14)
        label.text = "Joe sana arkadaşlık istedi gönderdi"
        return label
    }()
    
    private let acceptButton : UIButton = {
        let button = UIButton()
        button.setTitle("accept", for: UIControl.State.normal)
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
        label.frame = CGRect(x: widht * 0.5  - (widht * 0.7) / 2, y: 2, width: widht * 0.5, height: size2)
        
        declineButton.frame = CGRect(x: widht - size2, y: 2, width: size2, height: size2)
        
        //acceptButton.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        
        
    }
    
    override func prepareForReuse() {
        profileImage.image = nil
        label.text = nil
    }
    

    public func configure(with model : String) {
        
    }
    
    
    
    

}
