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
    static var shared: CoreDataManager = {
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
    func savePassword(password: ListPasswordEntity) {
        guard let managedObject = getManagedObject() else {
            return
        }
        managedObject.setValue(password.name, forKey: Constants.name)
        managedObject.setValue(password.user, forKey: Constants.user)
        managedObject.setValue(password.password, forKey: Constants.password)
        saveContext()
    }
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error al guardar")
        }
    }
    func getManagedObject() -> NSManagedObject? {
        guard let entity = NSEntityDescription.entity(forEntityName: Constants.passwordEntity, in: context) else {
            print("No existe la Entidad: \(Constants.passwordEntity)")
            return nil
        }
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        return managedObject
    }
}
