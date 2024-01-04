//
//  ViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit
import FirebaseAuth

struct FeedRenderViewModel {
    let header: PostRenderViewModel
    let post: PostRenderViewModel
    let actions: PostRenderViewModel
    let comments: PostRenderViewModel
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var feedRenderModel = [FeedRenderViewModel]()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(FeedPostTableViewCell.self, forCellReuseIdentifier: FeedPostTableViewCell.identifier)
        tableView.register(FeedPostHeaderTableViewCell.self, forCellReuseIdentifier: FeedPostHeaderTableViewCell.identifier)
        tableView.register(FeedPostActionTableViewCell.self, forCellReuseIdentifier: FeedPostActionTableViewCell.identifier)
        tableView.register(FeedPostReactionsTableViewCell.self, forCellReuseIdentifier: FeedPostReactionsTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "The Photo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapNotificationsButton))
        navigationItem.rightBarButtonItem?.tintColor = .label
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = createTableHeader()
        
        createMockData()
    }
    
    private func createMockData() {
        let user = User(profilePhoto: URL(string: "https://www.gooogle.com/")!,
                        name: "",
                        username: "Joe",
                        bio: "",
                        birthDate: Date(),
                        gender: .male,
                        joinDate: Date(),
                        friendsList: [])
        
        let post = UserPost(identifier: "",
                            postUrl: URL(string: "https://www.google.com/")!,
                            dailyChallange: "",
                            thumbnailImage: URL(string: "https://www.google.com/")!,
                            comments: [],
                            likeCount: [],
                            createdDate: Date(),
                            owner: user)
        
        var comments = [PostComments]()
        for x in 0..<2 {
            comments.append(PostComments(identifier: "\(x)",
                                         username: "jenny",
                                         text: "great post",
                                         createdDate: Date(),
                                         likes: []))
        }
        
        for x in 0..<5{
            let viewModel = FeedRenderViewModel(header: PostRenderViewModel(renderSection: .header(provider: user)),
                                                post: PostRenderViewModel(renderSection: .photo(provider: post)),
                                                actions: PostRenderViewModel(renderSection: .actions(provider: "")),
                                                comments: PostRenderViewModel(renderSection: .comments(comments)))
            
            feedRenderModel.append(viewModel)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
   /* override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }*/
    
   /* private func handleNotAuthenticated() {
        //Check auth status
        if Auth.auth().currentUser == nil {
            let loginVC = LogInViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC , animated: false)
        }
    }*/
    
    @objc func didTapNotificationsButton() {
        let vc = NotificationsViewController()
        vc.title = "Notifications"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createTableHeader() -> UIView {
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: widht, height: height / 17).integral)
        header.backgroundColor = .systemBackground
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
        
        let cameraButton = UIButton(frame: CGRect(x: widhtH * 0.93 - (widhtH * 0.07) / 2 , y: heightH * 0.72 - (widhtH * 0.07) / 2, width: widhtH * 0.07, height: widhtH * 0.07))
        cameraButton.setImage(UIImage(systemName: "camera.badge.clock"), for: UIControl.State.normal)
        cameraButton.backgroundColor = .systemBackground
        cameraButton.layer.cornerRadius = (widhtH * 0.07) / 2
        cameraButton.layer.borderWidth = 1
        cameraButton.layer.borderColor = UIColor.secondaryLabel.cgColor
        cameraButton.tintColor = .label
        cameraButton.addTarget(self, action: #selector(didTapCameraButton), for: UIControl.Event.touchUpInside)
        header.addSubview(cameraButton)
        
        return header
    }
    
    @objc private func didTapCameraButton() {
        //share post vc
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return feedRenderModel.count * 4
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let x = section
        let model : FeedRenderViewModel
        
        if x == 0 {
            model = feedRenderModel[0]
        }else{
            let position = x % 4 == 0 ? x/4 : ((x - (x % 4)) / 4)
            model = feedRenderModel[position]
        }
        
        let subSection = x % 4
        
        if subSection == 0 {
            //header
            return 1
            
        }else if subSection == 1{
            //post
            return 1
            
        }else if subSection == 2{
            //actions
            return 1
            
        }else if subSection == 3{
            //comments
            let commentsModel = model.comments
            switch commentsModel.renderSection {
            case .comments(let comments):
                return comments.count > 2 ? 2 : comments.count
            case .header, .actions, .photo : return 0
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let x = indexPath.section
        let model : FeedRenderViewModel
        
        if x == 0 {
            model = feedRenderModel[0]
        }else{
            let position = x % 4 == 0 ? x/4 : ((x - (x % 4)) / 4)
            model = feedRenderModel[position]
        }
        
        let subSection = x % 4
        
        if subSection == 0 {
            //header
            let headerModel = model.header
            switch headerModel.renderSection {
            case .header(let user):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostHeaderTableViewCell.identifier, for: indexPath) as! FeedPostHeaderTableViewCell
                cell.configure(with: user)
                cell.delegate = self
                return cell
            case .actions, .comments, .photo : return UITableViewCell()
            }
            
        }else if subSection == 1{
            //post
            let postModel = model.post
            switch postModel.renderSection {
            case .photo(let post):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostTableViewCell.identifier, for: indexPath) as! FeedPostTableViewCell
                cell.configure(with: post)
                return cell
            case .actions, .comments, .header : return UITableViewCell()
            }
            
        }else if subSection == 2{
            //actions
            let actionsModel = model.actions
            switch actionsModel.renderSection {
            case .actions(let provider):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostActionTableViewCell.identifier, for: indexPath) as! FeedPostActionTableViewCell
                
                return cell
            case .header, .comments, .photo : return UITableViewCell()
            }
            
        }else if subSection == 3{
            //comments
            let commentsModel = model.comments
            switch commentsModel.renderSection {
            case .comments(let comments):
                let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostReactionsTableViewCell.identifier, for: indexPath) as! FeedPostReactionsTableViewCell
                
                return cell
            case .header, .actions, .photo : return UITableViewCell()
            }
        }
        
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let subSection = indexPath.section % 4
        if subSection == 0 {
            return tableView.frame.size.height * 0.07
        }else if subSection == 1 {
            return tableView.frame.size.width
        }else if subSection == 2 {
            return tableView.frame.size.height * 0.06
        }else if subSection == 3 {
            return 50
        }
        return 0
    }

    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let subSection = section % 4
        return subSection == 3 ? 60 : 0
    }
}


extension FeedViewController : FeedPostHeaderTableViewCellDelegate {
    func didTapMostButton() {
        //action sheet
        let actionSheet = UIAlertController(title: "Post Options", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Report Post", style: .destructive, handler: { [weak self] _ in
            self?.reportPost()
        }))
        present(actionSheet, animated: true)
    }
    
    func reportPost(){
        
    }
}
