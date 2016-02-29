//
//  AddReminderVC.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

var reminderitem = [ReminderItem]()

//var currentDate: NSDate = currentDate
//var currentDesc: String = ""

class AddReminderVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {
 //connect button add reminder
 //communictae with same datastroage of tableview controller

    
    //MARK:Properties
    @IBOutlet var itemname: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var desc: UITextView!
    var currentName: String = ""
    var currentDesc: String = ""
  //  var currentDate: NSDate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        itemname.delegate = self
        date.minimumDate = NSDate()
        self.desc.layer.borderWidth = 1.0
        self.desc.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.desc.delegate = self
        self.desc.text = "Item Description"
        self.desc.textColor = UIColor.lightGrayColor()
        self.itemname.text = self.currentName
        self.desc.text = self.currentDesc
     //   self.date.setDate(currentDate, animated: true)
       

    }
    // MARK: UITextViewDelegate
    
    func textViewDidBeginEditing(textView: UITextView){
        if textView.textColor == UIColor.lightGrayColor(){
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView){
        if textView.text.isEmpty {
            textView.text = "Item Desciption"
            textView.textColor = UIColor.lightGrayColor()
        }
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
        let x = ReminderItem(name: itemname.text!,date: d, desc: desc.text!)
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
