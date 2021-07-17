//
//  RealmManager.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import Foundation
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    
    private let realm: Realm
    
    private init() {
        realm = try! Realm()
    }
    
    func readAll() -> [ItemModel] {
        let items = realm.objects(RItem.self)
        return items.map(ItemModel.init)
    }
    
    func deleteAll() {
        try! realm.write {
            let items = realm.objects(RItem.self)
            realm.delete(items)
        }
    }
    
    func upsert(items: [ItemModel]) {
        let newItems = items.map(RItem.init)
        
        try! realm.write {
            realm.add(newItems, update: .modified)
        }
    }
}
