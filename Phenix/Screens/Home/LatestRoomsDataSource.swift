//
//  LatestRoomsDataSource.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit
import CoreData

protocol LatestRoomsDataSourceDelegate: class  {
    func selectRoom(_ room: Room)
}

class LatestRoomsDataSource: NSObject {
    fileprivate let roomCellIdentifier = "incidentCell"
    
    fileprivate let storage = StorageController()
    fileprivate var fetchedResultController: NSFetchedResultsController<Room>
    
    weak var delegate: LatestRoomsDataSourceDelegate?
    weak var tableView: UITableView?
    
    override init() {
        self.fetchedResultController = storage.roomsFetchedResultsController()
        
        super.init()
    }
    
    func getRooms() {
        fetchedResultController.delegate = self
        try? fetchedResultController.performFetch()
        tableView?.reloadData()
    }
}

extension LatestRoomsDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultController.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: roomCellIdentifier, for: indexPath) as! RoomCell
        configure(cell: cell, atIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let room = fetchedResultController.object(at: indexPath)
        delegate?.selectRoom(room)
    }

    func configure(cell: RoomCell, atIndexPath indexPath: IndexPath) {
        let room = fetchedResultController.object(at: indexPath)
    }
}

extension LatestRoomsDataSource: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView?.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView?.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView?.insertRows(at: [indexPath], with: .fade)
            }
            
        case .delete:
            if let indexPath = indexPath {
                tableView?.deleteRows(at: [indexPath], with: .fade)
            }
            
        case .update:
            if let indexPath = indexPath {
                tableView?.reloadRows(at: [indexPath], with: .automatic)
            }
            
        case .move:
            if let indexPath = indexPath, let newIndexPath = newIndexPath {
                tableView?.deleteRows(at: [indexPath], with: .fade)
                tableView?.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}

