//
//  AddReminderVC.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

var reminderitem = [ReminderItem]()

class AddReminderVC: UIViewController, UITextFieldDelegate {
 //connect button add reminder
 //communictae with same datastroage of tableview controller
    
    //MARK:Properties
    @IBOutlet var itemname: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        itemname.delegate = self
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
   

    
    //MARK: Actions
    @IBAction func addReminder(sender: AnyObject){
        let d = NSDateFormatter.localizedStringFromDate(date.date, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle:NSDateFormatterStyle.ShortStyle)
        let x = ReminderItem(name: itemname.text!,date: d)
        DataStorage.sharedInstance.addReminder(x!)
        NSUserDefaults.standardUserDefaults().setObject(reminderitem, forKey: "list")
        itemname.text=""
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
