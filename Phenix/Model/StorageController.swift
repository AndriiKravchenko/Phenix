//
//  StorageController.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import CoreData

final class StorageController {
    static let shared = StorageController()
    
    var viewContext: NSManagedObjectContext { return persistentContainer.viewContext }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Phenix")        
        
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error {
                print("CoreData setup error: \(error)")
            }
        })
        return container
    }()
    
    func saveContext() -> Bool {
        guard viewContext.hasChanges else { return true }
        do {
            try viewContext.save()
            return true
        } catch let error {
            print("CoreData save error: \(error)")
            return false
        }
    }
    
    func visitedRoomsCount() -> Int {
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        fetchRequest.sortDescriptors = [Room.defaultSortDescriptor]
        
        let count = try? viewContext.count(for: fetchRequest)
        return count ?? 0
    }
    
    func addStubRooms() {
        let room1 = Room(context: viewContext)
        room1.name = "Room #1"
        
        let room2 = Room(context: viewContext)
        room2.name = "Room #2"
        
        let room3 = Room(context: viewContext)
        room3.name = "Room #3"
        
        _ = saveContext()
    }
    
    func roomsFetchedResultsController() -> NSFetchedResultsController<Room> {
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        fetchRequest.sortDescriptors = [Room.defaultSortDescriptor]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: viewContext, sectionNameKeyPath: nil, cacheName: nil)
    }
}
