//
//  HomeViewController.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var latestRoomTableView: UITableView!
    @IBOutlet weak var roomNameTextField: AttributedTextField!
    
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    private var logoTopConstraintOriginalValue: CGFloat = 0.0
    private let logoTopConstraintFullScreenValue: CGFloat = -200.0
    
    let viewModel = HomeViewModel()
    let roomsDataSource = LatestRoomsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveInitialConstraints()
        setupDataSource()
    }
    
    private func saveInitialConstraints() {
        logoTopConstraintOriginalValue = logoTopConstraint.constant
    }
    
    private func setupDataSource() {
        latestRoomTableView.dataSource = roomsDataSource
        latestRoomTableView.delegate = roomsDataSource
        roomsDataSource.delegate = self
        roomsDataSource.tableView = latestRoomTableView
        roomsDataSource.getRooms()
    }
    
    @IBAction func viewAllRoomsClicked(_ sender: Any) {
        logoTopConstraint.constant = logoTopConstraintFullScreenValue
    }
    
    @IBAction func createNewRoomClicked(_ sender: Any) {
        viewModel.createNewRoom()
    }
}

extension HomeViewController: LatestRoomsDataSourceDelegate {
    func selectRoom(_ room: Room) {
        
    }
}
