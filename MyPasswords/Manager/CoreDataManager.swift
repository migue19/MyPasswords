//
//  CoreDataManager.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 21/01/24.
//

import UIKit
import CoreData
class CoreDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    private static var shared: CoreDataManager = {
        let manager = CoreDataManager()
        return manager
    }()

}
