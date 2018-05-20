//
//  DataService.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-12.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    //create user 
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool ) -> () ) {
        
        if groupKey != nil {
            //send to group ref
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "sendeID": uid])
            sendComplete(true)
        }
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) -> ()) {
        
        REF_USERS.observeSingleEvent(of: .value) { (userSnapShot) in
            
            guard let userSnapShot = userSnapShot.children.allObjects as? [DataSnapshot] else {return}
            
            for user in userSnapShot {
                
                if user.key == uid {
                    handler((user.childSnapshot(forPath: "email").value as! String))
                }
            }
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ message: [Message]) -> ()) {
        
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderID = message.childSnapshot(forPath: "senderID").value as! String
                let message = Message(content: content, senderID: senderID)
                messageArray.append(message)
                
            }
            
            handler(messageArray)
        }
        
    }
    
    
    func getEmail(forSearchQuery query: String, handler: @escaping (_ emailArray: [String]) -> ()) {
        
        var emailArry = [String]()
        REF_USERS.observe(.value) { (userSnapShot) in
            
            guard let userSnapShot = userSnapShot.children.allObjects as? [DataSnapshot] else {return}
            
            for user in userSnapShot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) == true && email != Auth.auth().currentUser?.email {
                    emailArry.append(email)
                }
            }
            
            return handler(emailArry)
        }
        
    }
    
    func getIDs(forUsernames usernames: [String], handler: @escaping (_ uidArrat: [String]) -> ()) {
        
        REF_USERS.observe(.value) { (userSnapShot) in
            
            var idArray = [String]()
            guard let userSnapShot = userSnapShot.children.allObjects as? [DataSnapshot] else {return}
            
            for user in userSnapShot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if usernames.contains(email) {
                    idArray.append(user.key)
                }
            }
            
            handler(idArray)
        }
    }
    
    func createGroup(withTitle title: String, withDescription description: String, forUserIds id: [String] , hanlder: @escaping(_ groupCreated: Bool) -> ()) {
        
        REF_GROUPS.childByAutoId().updateChildValues(["title": title, "description": description, "members": id])
        hanlder(true)
    }
    
}
