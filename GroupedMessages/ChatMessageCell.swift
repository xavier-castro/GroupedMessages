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
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    /* chatMessage variable
     - Main purpose is to allow me to set incoming boolean on the cells
     - Basically to determine between sending text vs reciecing text bubble
     */
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            // Logic gate that decides if the bubble goes to the left or right
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear // Turns off the background color of cells to create the white color for the text
        
        bubbleBackgroundView.backgroundColor = .yellow
        bubbleBackgroundView.layer.cornerRadius = 12
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
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250), // Removes excess spacing if text is short
            
            // bubbleBackgroundView constraints
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
