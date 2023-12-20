//
//  ViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit
import FirebaseAuth

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "The Photo"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = createTableHeader()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
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
    
    private func createTableHeader() -> UIView {
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: widht, height: height / 12).integral)
        header.backgroundColor = .secondarySystemFill
        let widhtH = header.frame.size.width
        let heightH = header.frame.size.height
        
        let challangeLabel = UILabel(frame: CGRect(x: widhtH * 0.5 - (widhtH * 0.9) / 2, y: heightH * 0.5 - (heightH * 0.7) / 2, width: widhtH * 0.9, height: heightH * 0.7))
        challangeLabel.backgroundColor = .systemBackground
        challangeLabel.layer.masksToBounds = true
        challangeLabel.layer.cornerRadius = 20
        challangeLabel.layer.borderWidth = 1
        challangeLabel.layer.borderColor = UIColor.secondaryLabel.cgColor
        challangeLabel.numberOfLines = 2
        challangeLabel.text = "with your best friend from school"
        challangeLabel.textAlignment = .center
        challangeLabel.font = UIFont(name: "Helvetica", size: 18)
        header.addSubview(challangeLabel)
        
        let cameraButton = UIButton(frame: CGRect(x: widhtH * 0.93 - (widhtH * 0.1) / 2 , y: heightH * 0.86 - (widhtH * 0.1) / 2, width: widhtH * 0.1, height: widhtH * 0.1))
        cameraButton.setImage(UIImage(systemName: "camera.badge.clock"), for: UIControl.State.normal)
        cameraButton.tintColor = .label
        header.addSubview(cameraButton)
        
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

}

