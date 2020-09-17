//
//  TaskController.swift
//  TaskManager
//
//  Created by Deven Day on 9/16/20.
//  Copyright © 2020 Deven Day. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static let shared = TaskController()
    
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    init(){
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true), NSSortDescriptor(key: "dueDate" , ascending:true)]
        
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do{
            try fetchedResultsController.performFetch()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func addTask(name: String, notes: String?, dueDate: Date?) {
        _ = Task(name: name, dueDate: dueDate, notes: notes, isComplete: false)
        
        saveToPersistentStore()
    }
    
    func updateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        saveToPersistentStore()
    }
    
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            
            saveToPersistentStore()
        }
    }
    
    func toggleComplete(task: Task) {
        task.isComplete = !task.isComplete
        
        saveToPersistentStore()
    }
    
    func fetchTasks() -> [Task] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        return (try? moc.fetch(fetchRequest)) ?? []
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
}
