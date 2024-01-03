//
//  FeedPostActionTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import UIKit

protocol FeedPostActionTableViewCellDelegate : AnyObject {
    func didTapLikeButton()
    func didTapCommentButton()
}

class FeedPostActionTableViewCell: UITableViewCell {

    static let identifier = "FeedPostActionTableViewCell"
    
    weak var delegate : FeedPostActionTableViewCellDelegate?
    
    let likeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        button.tintColor = .label
        return button
    }()
    
    let commentButon : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: UIControl.State.normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButon)
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: UIControl.Event.touchUpInside)
        commentButon.addTarget(self, action: #selector(didTapCommentButton), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widht = contentView.frame.size.width
        let height = contentView.frame.size.height
        
        let size = height - 4
        likeButton.frame = CGRect(x: 10, y: 0, width: height, height: height)
        
        commentButon.frame = CGRect(x: widht * 0.15 , y: 0, width: height, height: height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    @objc func didTapLikeButton() {
        delegate?.didTapLikeButton()
    }
    
    @objc func didTapCommentButton() {
        delegate?.didTapCommentButton()
    }


}
