//
//  NewRoomViewController.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

class NewRoomViewController: UIViewController {
    @IBOutlet weak var roomNameTextField: RoomNameTextField!
    
    let viewModel = NewRoomViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapViewOutside(_ sender: Any) {
        view.endEditing(true)
    }
}

extension NewRoomViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
