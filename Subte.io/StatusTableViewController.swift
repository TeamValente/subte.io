//
//  StatusTableViewController.swift
//  Subte.io
//
//  Created by Mariano Molina on 2/10/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class StatusTableViewController: UITableViewController {

    
    let cellIdentifier = "statusCell"
    
    // MARK: Controller Properties
    let servicioSubte = SubwayServices()
    var lineLists = [SubwayLine]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        servicioSubte.fetch { (lines) in
            if let list = lines {
                self.lineLists = list
                
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lineLists.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StatusTableViewCell

        let line = lineLists[indexPath.row]
        
        cell.lineName.text = line.lineName
        cell.lineContainer.backgroundColor = line.lineColor
        cell.lineContainer.layer.borderColor = line.lineColor.cgColor
        cell.lineFrequency.text = line.lineFrequency
        
        cell.lineStatusMessage.text = line.lineStatus
        
        if line.lineStatus != "Normal" {
            cell.lineStatusMessage.textColor = UIColor.red
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}