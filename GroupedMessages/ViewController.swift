//
//  ViewController.swift
//  GroupedMessages
//
//  Created by Xavier Castro on 11/8/18.
//  Copyright © 2018 Xavier Castro. All rights reserved.
//
//  Following tutorial from https://www.youtube.com/watch?v=B92vSN5K4Rc

import UIKit


// ChatMessage struct is needed so you can capture both sent messages and recieving messages
struct ChatMessage {
    let text: String
    let isIncoming: Bool
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "id123"
    
    let chatMessages = [
        ChatMessage(text: "Here is my very first message", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", isIncoming: false),
        ChatMessage(text: "Yo, dawg, Whaddup", isIncoming: false),
        ChatMessage(text: "This message should appear at the left side", isIncoming: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none // Removes horizontal lines
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1) // Light gray color for table view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        // cell.textLabel?.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line."
        // cell.textLabel?.numberOfLines = 0 // Automatically sizes the rows for you
        
        let chatMessage = chatMessages[indexPath.row]
        
        //        cell.messageLabel.text = chatMessage.text
        //        cell.isIncoming = chatMessage.isIncoming
        
        cell.chatMessage = chatMessage
        
        
        return cell
    }
    
}

