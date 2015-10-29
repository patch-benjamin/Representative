//
//  RepresentativeDetailTableViewController.swift
//  Representatives
//
//  Created by Mike Gilroy on 29/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeDetailTableViewController: UITableViewController {
    
    var representative: Representative?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.title = self.representative?.name
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
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let representative = self.representative {
            
            switch indexPath.row {
            case 0:
                cell = tableView.dequeueReusableCellWithIdentifier("cellOne", forIndexPath: indexPath)
                cell.textLabel?.text = representative.name
                cell.detailTextLabel?.text = "\(representative.state!) - \(representative.district!)"
                cell.imageView?.image = UIImage(named: representative.state!)
                return cell
                
            case 1:
                cell = tableView.dequeueReusableCellWithIdentifier("cellTwo", forIndexPath: indexPath)
                cell.textLabel?.text = "Party"
                cell.detailTextLabel?.text = representative.party
                return cell
                
                
            case 2:
                cell = tableView.dequeueReusableCellWithIdentifier("cellTwo", forIndexPath: indexPath)
                cell.textLabel?.text = "Website"
                cell.detailTextLabel?.text = representative.link
                return cell
                
            case 3:
                cell = tableView.dequeueReusableCellWithIdentifier("cellTwo", forIndexPath: indexPath)
                cell.textLabel?.text = "Phone"
                cell.detailTextLabel?.text = representative.phone
                return cell
                
            case 4:
                cell = tableView.dequeueReusableCellWithIdentifier("cellTwo", forIndexPath: indexPath)
                cell.textLabel?.text = "Office"
                cell.detailTextLabel?.text = representative.office
                return cell
                
            default:
                cell = tableView.dequeueReusableCellWithIdentifier("cellOne", forIndexPath: indexPath)
                cell.textLabel?.text = "No details - vote for someone else"
                return cell
            }
            
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("cellOne", forIndexPath: indexPath)
            cell.textLabel?.text = "No details - vote for someone else"
            return cell
        }

    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(80)
        } else {
            return CGFloat(50)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
