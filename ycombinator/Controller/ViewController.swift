//
//  ViewController.swift
//  ycombinator
//
//  Created by Jaden Hong on 2023-08-28.
//

import UIKit

class ViewController: UITableViewController {
    
    var feedManager = FeedManager() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.tableViewCellIdentifier)
         
        feedManager.updateFeed()
        
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


 

