//
//  HomeBaseViewController.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

class HomeBaseViewController: UIViewController {
    @IBOutlet weak var latestRoomTableView: UITableView!
    @IBOutlet weak var roomNameTextField: RoomNameTextField!
    
    let roomsDataSource = RoomsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
    }
    
    private func setupDataSource() {
        latestRoomTableView.dataSource = roomsDataSource
        latestRoomTableView.delegate = roomsDataSource
        roomsDataSource.delegate = self
        roomsDataSource.tableView = latestRoomTableView
        roomsDataSource.getRooms()
    }
    
    @IBAction func viewTappedOutside(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func createNewRoomClicked(_ sender: Any) {
        navigationController?.pushViewController(UIStoryboard.newRoomViewController(), animated: true)
    }
}

extension HomeBaseViewController: RoomsDataSourceDelegate {
    func selectRoom(_ room: Room) {
        
    }
}
