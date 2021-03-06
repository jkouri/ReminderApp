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
    var date: NSDate
    var desc: String
    var alertController: UIAlertController
    //var alert: Bool
    
    // MARK: Initialization
    
    init?(name: String, date: NSDate, desc: String, alertController: UIAlertController) {
        self.name = name
        self.date = date
        self.desc = desc
        self.alertController = alertController
    }
    
   override func isEqual(object: AnyObject?) -> Bool {
        if let other = object as? ReminderItem{
            return (self.name == other.name && self.date.compare(other.date) == NSComparisonResult.OrderedSame)
        }else{
            return false
        }
    }
    //, date: NSDate, time: NSTimeInterval, alert:Bool) {
              //  self.date = date
      //  self.time = time
      //  self.alert = alert

    
    
    
}
