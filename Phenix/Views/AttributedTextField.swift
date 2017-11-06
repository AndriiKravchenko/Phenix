//
//  AttributedTextField.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

class AttributedTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = false
    }
}
