//
//  ViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit
import FirebaseAuth

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()

     
        
    }
    
    private func handleNotAuthenticated() {
        //Check auth status
        if Auth.auth().currentUser == nil {
            let loginVC = LogInViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC , animated: false)
        }
        
        
    }


}

