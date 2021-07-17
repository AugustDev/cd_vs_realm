//
//  Item.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import Foundation

struct ItemModel {
    let id: String
    let artist: String
    let title: String
    let medium: String
    let year: String
    let provenance: String
    let location: String
    
    /// we need struct default initializer as we add additional ones from Core Data and Realm entities
    init(id: String, artist: String, title: String, medium: String, year: String, provenance: String, location: String) {
        self.id = id
        self.artist = artist
        self.title = title
        self.medium = medium
        self.year = year
        self.provenance = provenance
        self.location = location
    }
}

/// init from core data entity
extension ItemModel {
    init(_ item: CDItem) {
        id = item.id ?? ""
        artist = item.artist ?? ""
        title = item.title ?? ""
        medium = item.medium ?? ""
        year = item.year ?? ""
        provenance = item.provenance ?? ""
        location = item.location ?? ""
    }
}

/// init from realm entity
extension ItemModel {
    init(_ item: RItem) {
        id = item.id
        artist = item.artist ?? ""
        title = item.title ?? ""
        medium = item.medium ?? ""
        year = item.year ?? ""
        provenance = item.provenance ?? ""
        location = item.location ?? ""
    }
}
