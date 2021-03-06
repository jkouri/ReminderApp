//
//  DataStorage.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

class DataStorage: NSObject {
    var reminderlist = [ReminderItem]()
    
    //swift singleton class
    //accessible to all view controllers
    
    static let sharedInstance = DataStorage()
    
    override init() {
        super.init();
        
    }
    

    
    func addReminder(item: ReminderItem){
        reminderlist.append(item)
        reminderlist.sortInPlace({$0.date.compare($1.date) == NSComparisonResult.OrderedAscending})
        
    }
    
    //called from table view
   // have array of reminderItems
    func getReminder() -> [ReminderItem] {
        return reminderlist;
    }

    
}
