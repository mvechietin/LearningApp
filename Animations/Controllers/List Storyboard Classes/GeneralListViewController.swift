//
//  GeneralListViewController.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 22/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class GeneralListViewController: UITableViewController {
    
    var functionsList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        functionsList.addObjects(from: ["Animações", "Integração REST + CoreData"])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functionsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomListCell = self.tableView.dequeueReusableCell(withIdentifier: "ListCell")! as! CustomListCell
        cell.setupListCell((functionsList.object(at: indexPath.row) as? String)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "MainStoryboardSegue", sender: self)
        case 1:
            performSegue(withIdentifier: "RestStoryboardSegue", sender: self)
        default:
            performSegue(withIdentifier: "", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
