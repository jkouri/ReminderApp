//
//  AddReminderVC.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit

var reminderitem = [ReminderItem]()
var now = NSDate()
var  timer = NSTimer()

class AddReminderVC: UIViewController, UITextFieldDelegate {
 //connect button add reminder
 //communictae with same datastroage of tableview controller
    
    //MARK:Properties
    @IBOutlet var itemname: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var desc: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        itemname.delegate = self
        
        date.minimumDate = NSDate()
        let timeInterval = floor(date.minimumDate!.timeIntervalSinceReferenceDate/60.0)*60.0
        date.minimumDate = NSDate(timeIntervalSinceReferenceDate: timeInterval)
        
        self.desc.layer.borderWidth = 2.0
        self.desc.layer.borderColor = UIColor.lightGrayColor().CGColor
     //   self.desc.delegate = self.desc
        self.desc.text = "Item Description"
        self.desc.textColor = UIColor.lightGrayColor()
        now = NSDate()
        /*
        timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"countUp", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
*/
    }
    
    /*
    func countUp(){
        for reminder in DataStorage.sharedInstance.reminderlist{
            if Int64(NSDate().timeIntervalSinceDate(reminder.date)) == 0 || Int64(NSDate().timeIntervalSinceDate(reminder.date)) == 1 || Int64(NSDate().timeIntervalSinceDate(reminder.date)) == -1{
                UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(reminder.alertController, animated: true, completion: nil)
            }
        }
    }
*/
    
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
   
    
    func dismissAlert(alert: UIAlertAction, x: ReminderItem){
        self.dismissViewControllerAnimated(true, completion: nil)
        var i = 0
        for item in DataStorage.sharedInstance.reminderlist{
            if(item == x){
                DataStorage.sharedInstance.reminderlist.removeAtIndex(i)
                break
            }
            i++
        }
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
    }
    
    
    func postponeAlert(alert: UIAlertAction, alertController: UIAlertController, x: ReminderItem){
        
        dispatch_async(dispatch_get_main_queue(), {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3600.00 * Double(NSEC_PER_SEC))), dispatch_get_main_queue())
                {
                    UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
                }
        })
    }
    
    
    func delay(date: NSDate, alertController: UIAlertController, x: ReminderItem){
        dispatch_async(dispatch_get_main_queue(), {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(date.timeIntervalSinceDate(NSDate()))*Double(NSEC_PER_SEC))), dispatch_get_main_queue())
                {
                    UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
                }
        })
        
    }
    
    
    //MARK: Actions
    @IBAction func addReminder(sender: AnyObject){
        let alertController = UIAlertController(title: "Reminder:", message: itemname.text!, preferredStyle: UIAlertControllerStyle.Alert)
        
        var d = date.date
        let timeInterval = floor(d.timeIntervalSinceReferenceDate/60.0)*60.0
        d = NSDate(timeIntervalSinceReferenceDate: timeInterval)
        
        let x = ReminderItem(name: itemname.text!,date: d, desc: desc.text!, alertController: alertController)
        DataStorage.sharedInstance.addReminder(x!)
        NSUserDefaults.standardUserDefaults().setObject(reminderitem, forKey: "list")
        itemname.text=""
        self.navigationController?.popToRootViewControllerAnimated(true)

        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Cancel, handler: {
            action in self.dismissAlert(action, x: x!)
        }))
        alertController.addAction(UIAlertAction(title: "Postpone", style: .Default, handler: {
            action in self.postponeAlert(action, alertController: alertController, x: x!)
        }))
        
        delay(d, alertController: alertController, x: x!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
