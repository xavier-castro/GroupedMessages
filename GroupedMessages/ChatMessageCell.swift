//
//  ChatMessageCell.swift
//  GroupedMessages
//
//  Created by Xavier Castro on 11/8/18.
//  Copyright © 2018 Xavier Castro. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel() // Represents a message
    let bubbleBackgroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 5
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
        //        messageLabel.backgroundColor = .green
        messageLabel.text = "We want to provide a longer string that is actually going to wrap onto the next line and maybe even a third line."
        messageLabel.numberOfLines = 0 // Word wraps long text
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /* Setting up constraints for our label with autospacing
         - the constant value is used to create spacing between each message
         - the 32 value in messageLabel is creating the spacing for each message
         - the 16 value in bubbleBackgroundView is creating padding inside the message bubble
         */
        let constraints = [
            
            // messageLabel constraints
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(equalToConstant: 250), // Makes the text appear to the left
            
            // bubbleBackgroundView constraints
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
            
        ]
        
        
        
        NSLayoutConstraint.activate(constraints)
        
        
        // messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
