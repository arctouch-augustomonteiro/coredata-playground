//
//  CoreDataManager.swift
//  CoreDataPlayground
//
//  Created by Augusto Monteiro on 06/04/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let container: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data: \(error)")
            }
        }
    }
    
}
