//
//  RoomNameTextField.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

class RoomNameTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayer()
        setupPlaceholder()
    }
    
    private func setupLayer() {
        layer.borderWidth = 1
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.white.cgColor
        layer.masksToBounds = false
    }
    
    private func setupPlaceholder() {
        attributedPlaceholder = NSAttributedString(string: "Enter Room Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)])
    }
}
