//
//  TableViewController.swift
//  ReminderApp
//
//  Created by Jacqueline Kouri on 2/19/16.
//  Copyright © 2016 Jacqueline Kouri. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController  {

    
    @IBOutlet var tableview: UITableView!
    var currentReminder: ReminderItem? = nil
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTableData:", name: "reload", object: nil)
    }
/*        if NSUserDefaults.standardUserDefaults().objectForKey("list") != nil {
            reminderlist = NSUserDefaults.standardUserDefaults().objectForKey("list") as! [ReminderItem] */
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    func reloadTableData(notification: NSNotification){
        tableview.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataStorage.sharedInstance.getReminder().count
        
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reminderID", forIndexPath: indexPath)
        let list = DataStorage.sharedInstance.reminderlist
        cell.textLabel?.text = list[indexPath.row].name
        cell.detailTextLabel?.text = NSDateFormatter.localizedStringFromDate(list[indexPath.row].date, dateStyle: NSDateFormatterStyle.FullStyle, timeStyle:NSDateFormatterStyle.ShortStyle)
        return cell
    }
  

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            DataStorage.sharedInstance.reminderlist.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(DataStorage.sharedInstance.reminderlist, forKey: "list")
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
   override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.currentReminder = DataStorage.sharedInstance.reminderlist[indexPath.row]
    if(currentReminder != nil) {
        self.performSegueWithIdentifier("EditReminder", sender: self)
        //self.parentViewController?.performSegueWithIdentifier("EditReminder", sender: self)
    }
    
    }

    
  
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


  
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //destVC.dynamicType.init()
        if (currentReminder != nil && segue.identifier == "EditReminder"){
            let destVC = segue.destinationViewController as! AddReminderVC
            
            destVC.currentName = (currentReminder?.name)!
            destVC.currentDate = currentReminder!.date
            destVC.currentDesc = (currentReminder?.desc)!
            destVC.currentAlertC = (currentReminder?.alertController)
        }
    }
    



}
