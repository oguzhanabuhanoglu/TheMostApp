//
//  PostViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 27.12.2023.
//

import UIKit

//states of a rendered cell
enum PostRenderSections {
    case header(provider: User)
    case photo(provider: UserPost) // post
    case actions(provider: String) // comment, like
    case comments([PostComments])
}

//model of rendered post
struct PostRenderViewModel {
    let renderSection: PostRenderSections
}

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var model : UserPost?
    
    private var renderModels = [PostRenderViewModel]()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(FeedPostTableViewCell.self, forCellReuseIdentifier: FeedPostTableViewCell.identifier)
        tableView.register(FeedPostHeaderTableViewCell.self, forCellReuseIdentifier: FeedPostHeaderTableViewCell.identifier)
        tableView.register(FeedPostActionTableViewCell.self, forCellReuseIdentifier: FeedPostActionTableViewCell.identifier)
        tableView.register(FeedPostReactionsTableViewCell.self, forCellReuseIdentifier: FeedPostReactionsTableViewCell.identifier)
        return tableView
    }()
    
    init(model: UserPost?) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        configureModels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureModels() {
        guard let userPostModel = self.model else {
            return
        }
        //header
        renderModels.append(PostRenderViewModel(renderSection: .header(provider: userPostModel.owner)))
        //post
        renderModels.append(PostRenderViewModel(renderSection: .photo(provider: userPostModel)))
        //actions
        renderModels.append(PostRenderViewModel(renderSection: .actions(provider: "")))
        //comments
        var comments = [PostComments]()
        for x in 0..<3{
            comments.append(PostComments(identifier: "123_\(x)",
                                         username: "Hakanka",
                                         text: "yanıyosun gardasım",
                                         createdDate: Date(),
                                         likes: []))
        }
        renderModels.append(PostRenderViewModel(renderSection: .comments(comments)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderSection {
        case .header(_): return 1
        case .photo(_):return 1
        case .actions(_): return 1
        case .comments(let comments): return comments.count > 3 ? 3 : comments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let model = renderModels[indexPath.section]
        
        switch model.renderSection {
        case .header(provider: let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostHeaderTableViewCell.identifier, for: indexPath) as! FeedPostHeaderTableViewCell
            cell.configure(with: user)
            cell.delegate = self
            return cell
        case .photo(provider: let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostTableViewCell.identifier, for: indexPath) as! FeedPostTableViewCell
            cell.configure(with: post)
            return cell
        case .actions(provider: let actions):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostActionTableViewCell.identifier, for: indexPath) as! FeedPostActionTableViewCell
            
            return cell
        case .comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedPostReactionsTableViewCell.identifier, for: indexPath) as! FeedPostReactionsTableViewCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        
        switch model.renderSection {
        case .header(_): return 60;
        case .photo(_): return tableView.frame.size.width;
        case .actions(_): return 60;
        case .comments(_): return 50
        }
    }

}


extension PostViewController : FeedPostHeaderTableViewCellDelegate {
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
