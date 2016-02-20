//
//  AddReminderVC.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

class AddReminderVC: UIViewController, UITextFieldDelegate {
 //connect button add reminder
 //communictae with same datastroage of tableview controller

    
    //MARK:Properties
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        descriptionTextField.delegate = self
    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
   
    func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    //MARK: Actions
    @IBAction func addReminder(sender: AnyObject){
   //     var reminder = ReminderItem();
     //   reminder.descriptionItem = descriptionTextField;
        
    }
    
}
