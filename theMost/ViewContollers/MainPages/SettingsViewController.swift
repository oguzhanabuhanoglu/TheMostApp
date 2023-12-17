//
//  SettingsViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 16.12.2023.
//

import UIKit

struct SettingsCellModel {
    let title : String
    let handler : (() -> Void)
}

final class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingsCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        configureModels()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func configureModels() {
        let section = [SettingsCellModel(title: "Log Out")  { [weak self] in
            self?.didTapLogOutButton()
            
        }]
        data.append(section)
    }
    
    
    private func didTapLogOutButton() {
        
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out", preferredStyle: UIAlertController.Style.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: UIAlertAction.Style.destructive, handler: { _ in
            
            AuthManager.shared.logOut { success in
                DispatchQueue.main.async {
                    if success{
                        //present login
                        let vc = LogInViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }else{
                        //error
                        fatalError("Could not log out user")
                        
                    }
                }
            }
        }))
        present(actionSheet, animated: true)
        //for ipads
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.section][indexPath.row].handler()
    }
    
    


}
