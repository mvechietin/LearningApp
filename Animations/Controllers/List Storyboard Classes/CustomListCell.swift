//
//  CustomListCell.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 22/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class CustomListCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupListCell(_ titleText: String) {
        titleLabel.text = titleText
    }
}
