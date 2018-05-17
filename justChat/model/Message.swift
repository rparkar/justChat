//
//  Message.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-17.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var sender: String {
        return _senderID
    }
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
}
