//
//  CoreDataManager.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 21/01/24.
//

import UIKit
import CoreData
class CoreDataManager {
    var context: NSManagedObjectContext!
    private static var shared: CoreDataManager = {
        let manager = CoreDataManager()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manager.context = appDelegate.persistentContainer.viewContext
        return manager
    }()
    func fetchData() -> [ListPasswordEntity] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.dbName)
        request.returnsObjectsAsFaults = false
        var passwords: [ListPasswordEntity] = []
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let name: String = data.value(forKey: Constants.name) as! String
                let user: String = data.value(forKey: Constants.user) as! String
                let password: String = data.value(forKey: Constants.password) as! String
                passwords.append(ListPasswordEntity(name: name, user: user, password: password))
            }
            return passwords
        } catch {
            print("Error al obtener los datos")
            return []
        }
    }
}
