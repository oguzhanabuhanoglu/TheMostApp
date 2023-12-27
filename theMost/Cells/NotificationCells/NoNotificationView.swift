//
//  NoNotificationView.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit

class NoNotificationView: UIView {

    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "No Notification Yet"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(imageView)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
        let widht = frame.size.width
        let height = frame.size.height
        
        imageView.frame = CGRect(x: widht * 0.5 - (widht * 0.3) / 2, y: height * 0.2 - (widht * 0.3) / 2, width: widht * 0.3, height: widht * 0.3).integral
        label.frame = CGRect(x: widht * 0.5 - (widht * 0.8) / 2, y: height * 0.6 - (height * 0.1) / 2, width: widht * 0.8, height: height * 0.1).integral
    }
    
}
