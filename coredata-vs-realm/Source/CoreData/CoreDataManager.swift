//
//  CoreDataManager.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import CoreData
import UIKit

public class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let persistentContainer: NSPersistentContainer
    
    private init() {
        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        self.persistentContainer = persistentContainer
    }

    func readAll() -> [ItemModel] {
        var items: [CDItem] = []
        
        let context = persistentContainer.viewContext
        context.performAndWait {
            items = CDItem.getAll(in: context)
        }
        
        return items.map(ItemModel.init)
    }
    
    func deleteAll() {
        let taskContext = persistentContainer.newBackgroundContext()
        CDItem.deleteAll(in: taskContext)
    }
    
    func create(items: [ItemModel]) -> Bool {
        var successfull = false
        
        let taskContext = persistentContainer.newBackgroundContext()
        
        taskContext.performAndWait {
            
            CDItem.create(items: items, in: taskContext)
            
            if taskContext.hasChanges {
                do {
                    try taskContext.save()
                    successfull = true
                } catch {
                    print("Error: \(error)\nCould not save Core Data context.")
                }
                taskContext.reset()
            }
            
        }
        
        return successfull
    }
    
    func update(items: [ItemModel]) -> Bool {
        var successfull = false
        
        let taskContext = persistentContainer.newBackgroundContext()
        
        taskContext.performAndWait {
            
            CDItem.update(items: items, in: taskContext)
            
            if taskContext.hasChanges {
                do {
                    try taskContext.save()
                    successfull = true
                } catch {
                    print("Error: \(error)\nCould not save Core Data context.")
                }
                taskContext.reset()
            }
        }
        
        return successfull
    }

}
