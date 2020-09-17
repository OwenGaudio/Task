//
//  TaskDetailTableViewController.swift
//  TaskManager
//
//  Created by Deven Day on 9/16/20.
//  Copyright © 2020 Deven Day. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextBody: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    var dueDateValue: Date?
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissEditing))
        view.addGestureRecognizer(tap)

        dueDateTextField.inputView = datePicker

        title = "New Task"
        if let task = task {
            title = "View Task"
            nameTextField.text = task.name
            notesTextBody.text = task.notes ?? ""

            if let dueDate = task.dueDate {
                dueDateValue = dueDate
                dueDateTextField.text = dueDate.stringValue()
            }
        }
    }
    
    @objc func dismissEditing() {
        view.endEditing(true)
    }
    
    //MARK: - Actions
    @IBAction func datePickerValueChanged(_ sender: Any) {
        if let datePicker = sender as? UIDatePicker {
            dueDateValue = datePicker.date
            dueDateTextField.text = datePicker.date.stringValue()
        }
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else {return}
        var dueDate: Date? = nil
        var notes: String? = nil
        
        if dueDateTextField.hasText {
            dueDate = datePicker.date
        }
        if notesTextBody.hasText {
            notes = notesTextBody.text
        }
        
        if let task = task {
            TaskController.shared.updateTask(task: task, name: name, notes: notes, dueDate: dueDate)
        } else {
            TaskController.shared.addTask(name: name, notes: notes, dueDate: dueDate)
        }
        
        navigationController?.popViewController(animated: true)
    }
}
