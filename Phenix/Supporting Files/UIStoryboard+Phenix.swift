//
//  UIStoryboard+Phenix.swift
//  Phenix
//
//  Created by Andrii Kravchenko on 06.11.17.
//  Copyright © 2017 Phenix. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func newRoomViewController() -> NewRoomViewController {
        return UIStoryboard(name: "Rooms", bundle: nil).instantiateViewController(withIdentifier: "newRoomViewController") as! NewRoomViewController
    }
    
    static func myRoomsViewController() -> MyRoomsViewController {
        return UIStoryboard(name: "Rooms", bundle: nil).instantiateViewController(withIdentifier: "myRoomsViewController") as! MyRoomsViewController
    }
}
