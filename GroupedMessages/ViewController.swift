//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Xavier Castro on 11/8/18.
//  Copyright © 2018 Xavier Castro. All rights reserved.
//
//  Following tutorial from https://www.youtube.com/watch?v=B92vSN5K4Rc

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id123"
    
    let textMessages = [
        "Here is my very first message",
        "I'm going to message another long message that will word wrap",
        "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none // Removes horizontal lines
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        // cell.textLabel?.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line."
        // cell.textLabel?.numberOfLines = 0 // Automatically sizes the rows for you
        cell.messageLabel.text = textMessages[indexPath.row]
        return cell
    }
    
}

