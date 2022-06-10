//
//  CoreDataManager.swift
//  CoreDadaSample
//
//  Created by ミズキ on 2022/06/11.
//

import Foundation
import CoreData

struct CoreDataManager {

    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Entity")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()
    
    @discardableResult
    func createEntity(title: String) -> Entity? {
        let context = persistentContainer.viewContext
        let entity = Entity(context: context)

        entity.title = title

        do {
            try context.save()
            return entity
        } catch let error {
            print("Failed to create: \(error)")
        }

        return nil
    }

    func fetchEntities() -> [Entity]? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Entity>(entityName: "Entity")

        do {
            let employees = try context.fetch(fetchRequest)
            return employees
        } catch let error {
            print("Failed to fetch companies: \(error)")
        }

        return nil
    }

    func fetchEntity(withName name: String) -> Entity? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Entity>(entityName: "Entity")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let employees = try context.fetch(fetchRequest)
            return employees.first
        } catch let error {
            print("Failed to fetch: \(error)")
        }

        return nil
    }

    func updateEntity(employee: Entity) {
        let context = persistentContainer.viewContext

        do {
            try context.save()
        } catch let error {
            print("Failed to update: \(error)")
        }
    }

    func deleteEntity(employee: Entity) {
        let context = persistentContainer.viewContext
        context.delete(employee)

        do {
            try context.save()
        } catch let error {
            print("Failed to delete: \(error)")
        }
    }

}
