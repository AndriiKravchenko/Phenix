//
//  Room.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import CoreData

class Room: NSManagedObject {
    static var defaultSortDescriptor: NSSortDescriptor {
        return NSSortDescriptor(key: "usageDate", ascending: true)
    }
}
