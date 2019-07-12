//
//  ListViewController.swift
//  cook list
//
//  Created by nodoka on 2019/05/04.
//  Copyright © 2019 nodoka. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var disharray: [Dictionary<String, String>] = []
    let ud = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        if ud.array(forKey: "disharray") != nil{
            disharray = ud.array(forKey: "disharray") as! [Dictionary<String, String>]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if ud.array(forKey: "disharray") != nil{
            disharray = ud.array(forKey: "disharray") as! [Dictionary<String, String>]
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return disharray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let dish = disharray[indexPath.row]
        let dishname = dish["dishname"]
        let genre = dish["genre"]
        cell.textLabel?.text = dishname
        cell.detailTextLabel?.text = genre
        return cell
    }

}
