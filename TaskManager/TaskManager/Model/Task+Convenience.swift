//
//  Task+Convenience.swift
//  TaskManager
//
//  Created by Deven Day on 9/16/20.
//  Copyright © 2020 Deven Day. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, dueDate: Date?, notes: String?, isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.dueDate = dueDate
        self.notes = notes
        self.isComplete = isComplete
    }
}
