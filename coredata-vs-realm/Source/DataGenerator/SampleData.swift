//
//  SampleData.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import Foundation

final class SampleData {
    static let artists = ["Damien Hirst", "Pablo Picasso", "Jeff Koons", "Banksy", "Yayoi Kusama", "Andy Copsey"]
    static let titles = ["Big", "Dog", "Careless", "Mexican hat", "Red rooster", "Rabbit", "Pumpkin"]
    static let medium = ["Canvas", "Bronze", "Iron", "Steel", "Black", "Mithril", "Adamant", "Runite"]
    static let locations = ["London", "New York", "Honalulu", "Lithuania", "Knowehere"]
    static let provenances = ["Harry potter", "New York Times", "The Shire morning news", "BBC", "Rocky wall"]
    
    static func generate(_ n: Int = 10000) -> [ItemModel] {
        var items: [ItemModel] = []
        
        for _ in 0..<n {
            
            let id = UUID().uuidString
            let artist = artists.randomElement()!
            let title = titles.shuffled().prefix(2).joined(separator: " ")
            let medium = medium.randomElement()!
            let year = String(Int.random(in: 1500..<2021))
            let location = locations.randomElement()!
            let provenance = provenances.randomElement()!
            
            let item = ItemModel(id: id, artist: artist, title: title, medium: medium, year: year, provenance: provenance, location: location)
            
            items.append(item)
        }
        
        return items
    }
}
