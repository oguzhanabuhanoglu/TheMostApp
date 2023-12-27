//
//  NotificationsViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit

enum NotificationType {
    case like(post: UserPost)
    case friendRequest
}

struct UserNotification {
    let type : NotificationType
    let text: String
    let user: User
}

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView : UITableView = {
        let tableview = UITableView()
        tableview.register(FriendRequestEventTableViewCell.self, forCellReuseIdentifier: FriendRequestEventTableViewCell.identifier)
        tableview.register(LikeEventTableViewCell.self, forCellReuseIdentifier: LikeEventTableViewCell.identifier)
        tableview.isHidden = false
        return tableview
    }()
    
    private lazy var noNotificationView = NoNotificationView()
    
    private var models = [UserNotification]()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchNotifications()
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        view.addSubview(spinner)
        //spinner.startAnimating()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
       
    }
    
    private func addNoNotificationView() {
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationView.frame = CGRect(x: 0, y: 0, width: widht / 2, height: widht / 2)
        noNotificationView.center = view.center
        
    }
    
    private func fetchNotifications(){
        for x in 0...40{
            let post = UserPost(identifier: "",
                                postUrl: URL(string: "https://www.gooogle.com/")!,
                                dailyChallange: "",
                                thumbnailImage: URL(string: "https://www.gooogle.com/")!,
                                comments: [],
                                likeCount: [],
                                createdDate: Date())
            
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .friendRequest,
                                         text: "Hello world",
                                         user: User(profilePhoto: URL(string: "https://www.gooogle.com/")!,
                                                    name: "",
                                                    username: "Joe",
                                                    bio: "",
                                                    birthDate: Date(),
                                                    gender: .male,
                                                    joinDate: Date()))
            
            models.append(model)
        }
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type {
        case .like(_):
            // like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: LikeEventTableViewCell.identifier, for: indexPath) as! LikeEventTableViewCell
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .friendRequest:
            // request cell
            let cell = tableView.dequeueReusableCell(withIdentifier: FriendRequestEventTableViewCell.identifier, for: indexPath) as! FriendRequestEventTableViewCell
            //cell.configure(with: model)
            cell.delegate = self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.06
    }
    

  

}


extension NotificationsViewController: LikeEventTableViewCellDelegate {
    func didTapRelatedPostButton(model: UserNotification) {
        print("tapped")
        //go to post vc
    }
}

extension NotificationsViewController: FriendRequestEventTableViewCellDelegate {
    func didTapAcceptButton() {
        print("tapped")
        //update database
    }
    
    func didTapDeclineButton() {
        print("tqpped")
        //delete row
    }
    
    
}
