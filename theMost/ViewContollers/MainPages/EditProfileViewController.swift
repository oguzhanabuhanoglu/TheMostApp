//
//  EditProfileViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 18.12.2023.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapSaveButton))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapCancelButton))
    }
    
    @objc private func didTapSaveButton(){
        
    }
    
    @objc private func didTapCancelButton(){
        
    }
    
    
    

    

}
