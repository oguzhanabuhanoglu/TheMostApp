//
//  EditProfileViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 18.12.2023.
//

import UIKit

struct EditProfileFormModel {
    let label : String
    let placeholdet : String
    var value : String?
}

final class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(EditProfileTableViewCell.self, forCellReuseIdentifier: EditProfileTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapSaveButton))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapCancelButton))
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.tableHeaderView = createTableHeaderView()
        
        configureModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    @objc private func didTapSaveButton(){
        
    }
    
    @objc private func didTapCancelButton(){
        dismiss(animated: true)
        
    }
    
    @objc private func didTapProfilePhotoButton(){
        
    }
    
    private func createTableHeaderView() -> UIView {
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: widht , height: height / 4).integral)
        
        let size = header.frame.height / 1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (widht - size) / 2, y: (header.frame.height - size) / 2, width: size, height: size))
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        profilePhotoButton.layer.cornerRadius = size / 2
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: UIControl.State.normal)
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: UIControl.Event.touchUpInside)
        header.addSubview(profilePhotoButton)
        
        return header
    }
    
    private func configureModel(){
        //name, username, bio
        let section1label = ["Name","Username","Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1label {
            let model = EditProfileFormModel(label: label, placeholdet: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        //email, phonenumber, gender
        let section2label = ["Email","Phone","Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2label {
            let model = EditProfileFormModel(label: label, placeholdet: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        
        models.append(section1)
        models.append(section2)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard section == 0 else{
            return nil
        }
        return "Private Infromation"
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: EditProfileTableViewCell.identifier, for: indexPath) as! EditProfileTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    

}

extension EditProfileViewController : EditProfileTableViewCellDelegate {
    func editProfileTableVİewCell(_ cell: EditProfileTableViewCell, didupdateField updatedModel: EditProfileFormModel) {
        //update the model
        print(updatedModel.value ?? "nil")
    }

}
