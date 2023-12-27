//
//  ProfileViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //COLLECTİON VİEW
    private var collectionView : UICollectionView?
    
    private var userPosts = [UserPost]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Best Of Your Gallery"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.2"), style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapFriendsButton))
        navigationItem.leftBarButtonItem?.tintColor = .label
        configureNavigationBar()
            
        let widht = view.frame.size.width
        let size = (widht - 4) / 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: size, height: size)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .systemBackground
        
        // register header
        collectionView?.register(ProfileHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderCollectionReusableView.identifier)
        //register cell
        collectionView?.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        guard collectionView == collectionView else{
            return
        }
        view.addSubview(collectionView!)
        
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        collectionView?.frame = view.bounds
       
    }
    
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapSettingsButton))
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    
    //buttons
    @objc func didTapSettingsButton(){
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc func didTapFriendsButton() {
        
    }
    
    
    //collection views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
        //return userPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let model = userPosts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
        cell.configure(debug: "wp")
        //cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //let model = userPosts[indexPath.row]
        let vc = PostViewController(model: nil)
        vc.title = "Posts"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileHeaderCollectionReusableView
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 3.8)
    }

}
