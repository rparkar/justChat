//
//  FeedViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-15.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    //outlers
    
    @IBOutlet weak var tableView: UITableView!
    
    //variables
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray
            self.tableView.reloadData()
        }
    }


}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else {return UITableViewCell()}
        
        let message = messageArray[indexPath.row]
        let image = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: image!, email: message.sender, contentMessage: message.content)
        return cell
    }
}
