//
//  ListViewModel.swift
//  CoreDataPlayground
//
//  Created by Augusto Monteiro on 06/04/22.
//

import Foundation
import CoreData

@MainActor
class ListViewModel: NSObject, ObservableObject {
    
    @Published var items = [Entity]()
    
    private let fetchedResultsController: NSFetchedResultsController<Entity>
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Entity.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        performFetch()
    }
    
    private func performFetch() {
        do {
            try fetchedResultsController.performFetch()
            guard let items = fetchedResultsController.fetchedObjects else { return }
            self.items = items
        } catch {
            print(error)
        }
    }
    
    func addItem() {
        do {
            let namesList = ["Augusto", "Laura", "Gustavo", "Arthur"]
            let item = Entity(context: context)
            item.name = namesList.randomElement()!
            try item.save()
        } catch {
            print(error)
        }
    }
    
    func deleteItem(itemId: NSManagedObjectID) {
        do {
            guard let item = try context.existingObject(with: itemId) as? Entity else { return}
            try item.delete()
        } catch {
            print(error)
        }
    }
}

extension ListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let items = controller.fetchedObjects as? [Entity] else { return }
        self.items = items
    }
}
