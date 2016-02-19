//
//  DataStorage.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

class DataStorage: NSObject {
    
    //swift singleton class
    //accessible to all view controllers
    
    static let sharedInstance = DataStorage()
    
    override init() {
        super.init();
        print("AAA"); //only getting initialized once
        
    }
    
    
    
    func addReminder(){
        
    }
    
    //called from table view
    //later sub class NS object and create a reminder sub class and have array of reminders
    func getReminder() -> [String]{
        return ["hi", "milk"];
    }

    
}
