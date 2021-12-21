//
//  TableViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 21.12.21.
//

import UIKit

class HistoryTableCell: UITableViewCell {
    @IBOutlet var from: UILabel!
    @IBOutlet var to: UILabel!
    
}

class TableViewController: UITableViewController {
    
    let history = [
        ["Moscow, Popova 37", "Moscow, Ploshad Vosstania 28"],
        ["Ivanovo, Samarinskaya 10", "Ivanovo, Samarinskaya 90"],
        ["Moscow, Svobodi 18", "Moscow, Vilisa latcisa 7"],
        ["Moscow, Taganskya 19", "Moscow, Urypinskaya 28"],
        ["Moscow, Generala Ushakova 37", "Moscow, NonAme 28"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("history")
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        print("5")
//        return 5
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return history.count
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("here")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        return cell
//    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryTableCell
//        cell.textLabel?.text = "from: " + history[indexPath.row][0] + "to: " + history[indexPath.row][1]
        cell.from.text = "from: " + history[indexPath.row][0]
        cell.to.text = "to: " + history[indexPath.row][1]
//        print("here")
        // Configure the cell...

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
