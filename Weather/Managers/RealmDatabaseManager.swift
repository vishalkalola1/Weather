//
//  CoreDataHelper.swift
//  Weather
//
//  Created by vishal on 10/13/22.
//

import Foundation
import RealmSwift

protocol DatabaseProviderProtocol {
    func create(_ object: Object) throws
    func fetch(_ objectType: Object.Type) -> Object?
}

class RealmDatabaseProvider: DatabaseProviderProtocol {
    
    private let realm: Realm
    
    init() {
        self.realm = try! Realm()
    }
    
    func create(_ object: Object) throws {
        try! realm.write { realm.add(object)}
    }
    
    func fetch(_ objectType: Object.Type) -> Object? {
        let obj = realm.objects(objectType).first
        return obj
    }
}
