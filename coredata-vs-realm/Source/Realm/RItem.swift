//
//  RItem.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import Foundation
import RealmSwift

class RItem: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var artist: String?
    @Persisted var title: String?
    @Persisted var medium: String?
    @Persisted var year: String?
    @Persisted var provenance: String?
    @Persisted var location: String?

    convenience init(id: String, artist: String, title: String, medium: String, year: String, provenance: String, location: String) {
        self.init()
        self.id = id
        self.artist = artist
        self.title = title
        self.medium = medium
        self.year = year
        self.provenance = provenance
        self.location = location
    }
}

extension RItem {
    convenience init(_ item: ItemModel) {
        self.init()
        self.id = item.id
        self.artist = item.artist
        self.title = item.title
        self.medium = item.medium
        self.year = item.year
        self.provenance = item.provenance
        self.location = item.location
    }
}
