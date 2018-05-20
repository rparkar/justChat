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
    
    
    //variale
    var groupsArray = [Group]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapShot) in
            
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                
                self.groupsArray = returnedGroupsArray
                self.tableView.reloadData()
            }
            
        }
        

    }

}


extension GroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else {return UITableViewCell()}
        
        let group = groupsArray[indexPath.row]
        cell.configureCell(groupTitle: group.groupTitle, groupDescription: group.groupDescription, memberCount: group.memberCount)
        
        return cell
    }
}
