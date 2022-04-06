//
//  Entity+BaseModel.swift
//  CoreDataPlayground
//
//  Created by Augusto Monteiro on 06/04/22.
//

import Foundation
import CoreData

extension Entity: BaseModel {
    
    static var all: NSFetchRequest<Entity> {
        let request = Entity.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    public var id: NSManagedObjectID {
        self.objectID
    }
    
}
