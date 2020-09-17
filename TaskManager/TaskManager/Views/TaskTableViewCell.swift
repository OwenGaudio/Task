//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Deven Day on 9/16/20.
//  Copyright © 2020 Deven Day. All rights reserved.
//

import UIKit

protocol TaskCellDelegate {
    func completeButtonTapped(sender: TaskTableViewCell)
}
class TaskTableViewCell: UITableViewCell {

//MARK: - Outlets
    @IBOutlet weak var titleTaskLabel: UILabel!
    @IBOutlet weak var detailTaskLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var delegate: TaskListTableViewController?
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        titleTaskLabel.text = task?.name
        
        let imageName = (task?.isComplete ?? false) ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)

        if let dueDate = task?.dueDate, let notes = task?.notes {
            detailTaskLabel.text = "\(dueDate.stringValue()) · \(notes)"
        } else if let dueDate = task?.dueDate {
            detailTaskLabel.text = dueDate.stringValue()
        } else if let notes = task?.notes {
            detailTaskLabel.text = notes
        }
    }
    
//MARK: - Actions
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.completeButtonTapped(sender: self)
    }
}
