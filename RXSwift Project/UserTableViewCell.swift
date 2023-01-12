//
//  UserTableViewCell.swift
//  RXSwift Project
//
//  Created by NomoteteS on 12.01.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "UserTableViewCell")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
