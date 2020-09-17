//
//  CoreDataStack.swift
//  TaskManager
//
//  Created by Deven Day on 9/16/20.
//  Copyright © 2020 Deven Day. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        // Change the container name for every project!!
        let container = NSPersistentContainer(name: "TaskManager")
        
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext }
}
