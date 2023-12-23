//
//  ProfileViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    //HEADER VİEW
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
    
    //FOOTER VİEW
    private let profileFooterView : UIView = {
        let footer = UIView()
        footer.backgroundColor = .secondarySystemBackground
        footer.layer.masksToBounds = true
        footer.layer.cornerRadius = 30
        return footer
    }()
    
    private let footerTittle : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = "Your Library"
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textColor = .label
        return label
    }()
    
    private let collectionPrivacyLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = "Visible only to you"
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica-Bold", size: 12)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let seeAllButton : UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: UIControl.State.normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(UIColor.label, for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.addTarget(self, action: #selector(didTapSeeAll), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    /*private let profileCollectionView : UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()*/
    
    //PİN VİEW
    private let pinsTittleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = "Pins"
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textColor = .label
        return label
    }()
    
    private let pinsPrivacyLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.text = "Visible by friends"
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica-Bold", size: 12)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let pinImageView1 : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let pinImageView2 : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let pinImageView3 : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profil"
        configureNavigationBar()
        
        view.addSubview(profileHeaderView)
        view.addSubview(profileFooterView)
        view.addSubview(pinsTittleLabel)
        view.addSubview(pinsPrivacyLabel)
        view.addSubview(pinImageView1)
        view.addSubview(pinImageView2)
        view.addSubview(pinImageView3)
        view.addSubview(collectionPrivacyLabel)
        view.addSubview(footerTittle)
        
        profileHeaderView.addSubview(profileImageView)
        profileHeaderView.addSubview(nameLabel)
        profileHeaderView.addSubview(usernameLabel)
        
        profileFooterView.addSubview(seeAllButton)
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        //HEADER AND HEADER ITEMS
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: widht, height: height / 3)
        
        let widhtH = profileHeaderView.frame.size.width
        let heightH = profileHeaderView.frame.size.height
        let size = profileHeaderView.frame.height / 2.5
        
        profileImageView.frame = CGRect(x: widhtH * 0.5 - (size) / 2, y: heightH * 0.54 - (size) / 2, width: size, height: size)
        profileImageView.layer.cornerRadius = size / 2
        
        nameLabel.frame = CGRect(x: widhtH * 0.5 - (widhtH * 0.9) / 2, y: heightH * 0.81 - (heightH * 0.13) / 2, width: widhtH * 0.9, height: heightH * 0.13)
        
        usernameLabel.frame = CGRect(x: widhtH * 0.5 - (widhtH * 0.9) / 2, y: heightH * 0.92 - (heightH * 0.07) / 2, width: widhtH * 0.9, height: heightH * 0.07)
        
        
        //PINS VİEW
        pinsTittleLabel.frame = CGRect(x: 5, y: height / 2.95, width: widht * 0.5, height: height * 0.03)
        pinsPrivacyLabel.frame = CGRect(x: widht - (widht * 0.4) - 13, y: height / 2.95, width: widht * 0.4, height: height * 0.03)
        pinImageView1.frame = CGRect(x: 5, y: height * 0.5 - (height / 4) / 2, width: (widht / 3) - 20, height: height / 5.5)
        pinImageView2.frame = CGRect(x: 25 + (widht / 3) - 20, y: height * 0.5 - (height / 4) / 2, width: (widht / 3) - 20, height: height / 5.5)
        pinImageView3.frame = CGRect(x: 45 + 2 * ((widht / 3) - 20), y: height * 0.5 - (height / 4) / 2, width: (widht / 3) - 20, height: height / 5.5)
    
        
        
        //FOOTER AND FOOTER İTEMS
        profileFooterView.frame = CGRect(x: 5, y: height - (height / 2.7) - 20 , width: widht - 10, height: height / 2.7)
        
        let widhtF = profileFooterView.frame.size.width
        let heightF = profileFooterView.frame.size.height
        
        footerTittle.frame = CGRect(x: 5, y: height / 1.75, width: widht * 0.5, height: height * 0.03)
        collectionPrivacyLabel.frame = CGRect(x: widht - (widht * 0.4) - 13, y: height / 1.75, width: widht * 0.4, height: height * 0.03)
        
        seeAllButton.frame = CGRect(x: widhtF * 0.5 - (widhtF * 0.2) / 2, y: heightF * 0.73 - (heightF * 0.1) / 2, width: widhtF * 0.2, height: heightF * 0.1)
        
        
        
        
        
        
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
    
    @objc func didTapSeeAll() {
        let profileCollectionVC = ProfileCollectionViewController()
        profileCollectionVC.title = "Besties From Your Gallery"
        navigationController?.pushViewController(profileCollectionVC, animated: true)
    }

 

}
