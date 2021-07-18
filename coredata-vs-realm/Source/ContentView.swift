//
//  ContentView.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CoreDataView()
            
            RealmView()
        }
    }
}

struct CoreDataView: View {
    var coreDataManager = CoreDataManager.shared
    @State var sampleItems: [ItemModel] = []
    
    func coreDataReadAll() {
        Utilities.measure("Read") {
            let items = coreDataManager.readAll()
            print("loaded \(items.count)")
        }
    }
    
    func coreDataCreate() {
        sampleItems = SampleData.generate(10000)
        Utilities.measure("Create") {
            _ = coreDataManager.upsert(items: sampleItems)
        }
    }
    
    func coreDataUpdate() {
        Utilities.measure("Update") {
            _ = coreDataManager.upsert(items: sampleItems)
        }
    }
    
    func coreDataDelete() {
        Utilities.measure("Delete") {
            coreDataManager.deleteAll()
        }
    }
    
    var body: some View {
        VStack {
            Text("Core data")
                .font(.largeTitle)
            HStack {
                CustomButton(text: "Read all", onTap: coreDataReadAll)
                CustomButton(text: "Create", onTap: coreDataCreate)
                CustomButton(text: "Update", onTap: coreDataUpdate)
                CustomButton(text: "Delete all", onTap: coreDataDelete)
            }
        }
    }
}

struct RealmView: View {
    var realmManager = RealmManager.shared
    @State var sampleItems: [ItemModel] = []
    
    func readAll() {
        Utilities.measure("Read") {
            let items = realmManager.readAll()
            print("loaded \(items.count)")
        }
    }
    
    func create() {
        sampleItems = SampleData.generate(10000)
        Utilities.measure("Create") {
            realmManager.upsert(items: sampleItems)
        }
    }
    
    func update() {
        Utilities.measure("Update") {
            realmManager.upsert(items: sampleItems)
        }
    }
    
    func delete() {
        Utilities.measure("Delete") {
            realmManager.deleteAll()
        }
    }
    
    var body: some View {
        VStack {
            Text("Realm")
                .font(.largeTitle)
            HStack {
                CustomButton(text: "Read all", onTap: readAll)
                CustomButton(text: "Create", onTap: create)
                CustomButton(text: "Update", onTap: update)
                CustomButton(text: "Delete all", onTap: delete)
            }
        }
    }
}

