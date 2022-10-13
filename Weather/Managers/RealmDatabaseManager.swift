//
//  CoreDataHelper.swift
//  Weather
//
//  Created by vishal on 10/13/22.
//

import Foundation
import RealmSwift

protocol DatabaseProviderProtocol {
    func create(_ object: Weathers) throws
    func fetch(_ objectType: Weathers.Type) -> Weathers?
}

class RealmDatabaseProvider: DatabaseProviderProtocol {
    
    private let realm: Realm
    
    init() {
        self.realm = try! Realm()
    }
    
    func create(_ object: Weathers) throws {
        try! realm.write { realm.add(object)}
    }
    
    func fetch(_ objectType: Weathers.Type) -> Weathers? {
        let obj = realm.objects(objectType).toArray(ofType: objectType.self).first
        return obj
    }
}
