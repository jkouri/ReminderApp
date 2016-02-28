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
        date.minimumDate = NSDate()
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
   
    
    func dismissAlert(alert: UIAlertAction){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: Actions
    @IBAction func addReminder(sender: AnyObject){
        let alertController = UIAlertController(title: "Reminder:", message: itemname.text!, preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Dismiss", style: .Cancel, handler: dismissAlert)
        
        alertController.addAction(cancel)
        
        let d = date.date
        let x = ReminderItem(name: itemname.text!,date: d)
        DataStorage.sharedInstance.addReminder(x!)
        NSUserDefaults.standardUserDefaults().setObject(reminderitem, forKey: "list")
        itemname.text=""
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
