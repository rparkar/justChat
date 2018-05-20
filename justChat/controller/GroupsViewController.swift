//
//  GroupsViewController.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-15.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

}


extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else {return UITableViewCell()}
        
        cell.configureCell(groupTitle: "something", groupDescription: "something else", memberCount: 2)
        
        return cell
    }
}
