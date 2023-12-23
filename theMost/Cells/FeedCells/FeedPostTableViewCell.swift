//
//  FeedPostTableViewCell.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 23.12.2023.
//

import UIKit

class FeedPostTableViewCell: UITableViewCell {

    static let identifier = "FeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
