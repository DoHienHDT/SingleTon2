//
//  TableViewController.swift
//  SingleTon2
//
//  Created by dohien on 6/4/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var FooterView: UIView!
    @IBOutlet var NoData: UIView!
    var hasNoData : Bool = false {
        didSet{
        hasNoData ? (tableView.tableFooterView = NoData) : (tableView.tableFooterView = FooterView)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        hasNoData = SingleTon.instance.numbers.count == 0
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SingleTon.instance.numbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = String(SingleTon.instance.numbers[indexPath.row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            SingleTon.instance.numbers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            hasNoData = SingleTon.instance.numbers.count == 0
        }
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let detail = segue.destination as? ViewController
            detail?.indexPath = indexPath
        }
    }
    

}
