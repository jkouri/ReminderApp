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
        print("AAA"); //only getting initialized once
        
    }
    
    
    
    func addReminder(item: ReminderItem){
        reminderlist.append(item)
        reminderlist.sortInPlace({$0.date > $1.date})
        
    }
    
    //called from table view
   // have array of reminderItems
    func getReminder() -> [ReminderItem] {
        return reminderlist;
    }

    
}
