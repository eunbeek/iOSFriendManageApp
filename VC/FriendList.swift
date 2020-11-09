//
//  FriendListTableViewController.swift
//  Midterm_Test
//  Write Your name Here
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit
// EK : FriendList Controller
class FriendList: UITableViewController, addFriendDelegateProtocol {

    // EK : To define Model with DataModelManager
    var myModel : DataModelManager?
    
    // EK : Basic list on the table view
    @IBOutlet weak var listTable : UITableView!
    
    // EK : Protocol to get the value from FriendADD Controller
    func addFinishWithFriendObject(newFD : Friend)
    {
        myModel?.insertFriend(newFD: newFD)
        listTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Table view data source
    // EK : Table View Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (myModel?.friendList.count)!

    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lNameLabel.text = "\(myModel!.friendList[indexPath.row].getLastName())"
        cell.imagePrint.image = myModel!.friendList[indexPath.row].getImage()
        return cell
    }
   
    // MARK: - Navigation
    // EK : To prepare passing value to next controller or scene by segue identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // EK : FriendAdd
        if segue.identifier == "addNewFriend"
        {
            let secondVC = segue.destination as! FriendAdd
            secondVC.delegate = self
        }
        else if segue.identifier == "detailFriend" // EK : FriendScene
        {
            let thirdVC = segue.destination as! FriendScene
            thirdVC.detailView = myModel!.friendList[listTable.indexPathForSelectedRow!.row]
        }

    }
}
