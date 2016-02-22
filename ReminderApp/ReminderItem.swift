//
//  ReminderItem.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

class ReminderItem: NSObject {

    //simple details -name, time, ect.
    //data strogate will hold array of reminderItems
  
    //MARK: Properties
    var name: String
    var date: String
    var time: String
    //var alert: Bool
    
    // MARK: Initialization
    
    init?(name: String, date: String, time: String) {
        self.name = name
        self.date = date
        self.time = time
    }
    //, date: NSDate, time: NSTimeInterval, alert:Bool) {
              //  self.date = date
      //  self.time = time
      //  self.alert = alert

    
    
    
}
