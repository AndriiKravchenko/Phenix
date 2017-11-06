//
//  HomeViewController.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

class HomeViewController: HomeBaseViewController {    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func viewAllRoomsClicked(_ sender: Any) {
        navigationController?.pushViewController(UIStoryboard.myRoomsViewController(), animated: true)
    }
}
