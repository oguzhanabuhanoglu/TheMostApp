//
//  ProfileViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView : UIView = {
        let header = UIView()
        header.backgroundColor = .systemBackground
        return header
    }()
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .label
        configureNavigationBar()
        
        view.addSubview(profileHeaderView)
        
        profileHeaderView.addSubview(profileImageView)
        profileHeaderView.addSubview(nameLabel)
        profileHeaderView.addSubview(usernameLabel)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: widht, height: height / 3)
        
        let widhtH = profileHeaderView.frame.size.width
        let heightH = profileHeaderView.frame.size.height
        let size = profileHeaderView.frame.height / 2.5
        
        profileImageView.frame = CGRect(x: widhtH * 0.5 - (size) / 2, y: heightH * 0.54 - (size) / 2, width: size, height: size)
        profileImageView.layer.cornerRadius = size / 2
        
        nameLabel.frame = CGRect(x: widhtH * 0.5 - (widhtH * 0.9) / 2, y: heightH * 0.81 - (heightH * 0.13) / 2, width: widhtH * 0.9, height: heightH * 0.13)
        
        usernameLabel.frame = CGRect(x: widhtH * 0.5 - (widhtH * 0.9) / 2, y: heightH * 0.92 - (heightH * 0.07) / 2, width: widhtH * 0.9, height: heightH * 0.07)
        
        
        
        
    }
    
    
    private func configureNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapSettingsButton))
        navigationItem.rightBarButtonItem?.tintColor = .label
        
    }
    
    @objc func didTapSettingsButton(){
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        navigationController?.pushViewController(settingsVC, animated: true)
    }

 

}
