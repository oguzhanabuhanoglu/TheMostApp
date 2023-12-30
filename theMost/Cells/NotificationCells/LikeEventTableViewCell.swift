//
//  LikeEventTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit
import SDWebImage

protocol LikeEventTableViewCellDelegate: AnyObject {
    func didTapRelatedPostButton(model: UserNotification)
}

class LikeEventTableViewCell: UITableViewCell {

    static let identifier = "LikeEventTableViewCell"
    
    weak var delegate: LikeEventTableViewCellDelegate?
    
    private var model : UserNotification?
    
    private let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sisifos")
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "Helvetica", size: 15)
        label.numberOfLines = 2
        label.text = "Joe liked your post"
        return label
    }()
    
    private let postButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "wp"), for: UIControl.State.normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        addSubview(profileImage)
        addSubview(label)
        addSubview(postButton)
        
        postButton.addTarget(self, action: #selector(didTapPostButton), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widht = contentView.frame.size.width
        let height = contentView.frame.size.height
        
        let size = height - 2
        profileImage.frame = CGRect(x: 3, y: 1, width: size, height: size)
        profileImage.layer.cornerRadius = size / 2
        
        let size2 = height - 4
        postButton.frame = CGRect(x: widht - size2, y: 2, width: size2, height: size2)
        
        label.frame = CGRect(x: widht * 0.52  - (widht * 0.7) / 2, y: 2, width: widht * 0.6, height: size2)
        
    }
    
    override func prepareForReuse() {
        postButton.setBackgroundImage(nil, for: UIControl.State.normal)
        profileImage.image = nil
        label.text = nil
    }
    
    @objc func didTapPostButton() {
        //fonksiyonu notificationViewController içerisinde uygulayacağımız için  protocol olarak aldık ve any object yaptık ki bu fonksiyona başka sınıf içerisinden ulaşabilelim.protocolo  notificationVC ye comfrom ettikten sonra onksiyon içeriğini extensiyon olarak orada yazacağız.
        guard let model = model else {
            return
        }
        delegate?.didTapRelatedPostButton(model: model)
    }
    

    public func configure(with model : UserNotification) {
        //bu cell içinde olusturduğumuz modeli configure func parametresi olan modela assign ettik.Burada bilgileri aldıktan sonra NotificationViewControllerda tanımladığımız bu cell fonksiyonları altında configure fonksiyonunu çağıracağız.Bilgileri burada bu modele atadığımız için oraya sadece onları getireğiz.
        self.model = model
        
        switch model.type {
        case .like(let post):
            let thumbnail = post.thumbnailImage
            guard !thumbnail.absoluteString.contains("google.com") else {
                return
            }
            postButton.sd_setImage(with: thumbnail, for: UIControl.State.normal, completed: nil)
            break
        case .friendRequest:
            break
        }
        
        label.text = model.text
        profileImage.sd_setImage(with: model.user.profilePhoto, completed: nil)
        
    }
    
    
    

}
