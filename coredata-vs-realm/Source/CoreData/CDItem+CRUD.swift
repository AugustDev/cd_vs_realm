//
//  CDItem+Extension.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import Foundation
import CoreData

/// Core data item with CRUD operations
extension CDItem {
    
    /// create single item
    static func create(item: ItemModel, in context: NSManagedObjectContext) {
        let newItem = CDItem(context: context)
        newItem.id = item.id
        newItem.artist = item.artist
        newItem.title = item.title
        newItem.medium = item.medium
        newItem.year = item.year
        newItem.location = item.location
        newItem.provenance = item.provenance
    }
    
    /// create list of items
    static func create(items: [ItemModel], in context: NSManagedObjectContext) {
        for item in items {
            create(item: item, in: context)
        }
    }
    
    /// update single item
    static func update(item: ItemModel, in context: NSManagedObjectContext) {
        let request: NSFetchRequest<CDItem> = CDItem.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", item.id)
        request.fetchLimit = 1
        
        do {
            let matches = try context.fetch(request)
            if matches.count > 0 {
                assert(matches.count == 1, "item ids should be unique")
                let dbItem = matches[0]
                
                dbItem.id = item.id
                dbItem.artist = item.artist
                dbItem.title = item.title
                dbItem.medium = item.medium
                dbItem.year = item.year
                dbItem.provenance = item.provenance
                dbItem.location = item.location
            }
        } catch {
            print("error core data update \(error)")
        }
    }
    
    ///update many items
    static func update(items: [ItemModel], in context: NSManagedObjectContext) {
        for item in items {
            update(item: item, in: context)
        }
    }
    
    static func getAll(in context: NSManagedObjectContext) -> [CDItem] {
        let request: NSFetchRequest<CDItem> = CDItem.fetchRequest()
        
        do {
            let matches = try context.fetch(request)
            return matches
            
        } catch {
            print("CDItem.getAll failed with: \(error)")
        }
        
        return []
    }
    
    static func deleteAll(in context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CDItem")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            print("CDItem.deleteAll failed with \(error)")
        }
    }
    
    
}
