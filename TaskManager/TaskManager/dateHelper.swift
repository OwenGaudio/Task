//
//  dateHelper.swift
//  TaskManager
//
//  Created by Deven Day on 9/16/20.
//  Copyright © 2020 Deven Day. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
