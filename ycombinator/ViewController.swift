//
//  ViewController.swift
//  ycombinator
//
//  Created by Jaden Hong on 2023-08-28.
//

import UIKit

struct K {
    static var testList = [1,2,3,4,5]
    static var tableViewCellIdentifier = "cell"
    static var nibName = "TableViewCell"
}

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.tableViewCellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableViewCellIdentifier, for: indexPath) as! TableViewCell
        cell.leftLabel.backgroundColor = .systemOrange
        cell.midLabel.backgroundColor = .systemYellow
        cell.rightLabel.backgroundColor = .systemGreen
        return cell
    }


}
 
