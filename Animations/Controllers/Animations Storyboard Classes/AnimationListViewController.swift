//
//  AnimationListViewController.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 19/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class AnimationListViewController: UITableViewController {
    
    let animationsList = ["Chain Animation", "Download Animation", "Pulse Animation", "TableView Animation", "Bounce Button Animation"] as NSArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animationsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AnimationCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")! as! AnimationCell
        cell.setupListCell((animationsList.object(at: indexPath.row) as? String)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "ChainAnimationSegue", sender: self)
        case 1:
            performSegue(withIdentifier: "CircleAnimationSegue", sender: self)
        case 2:
            performSegue(withIdentifier: "PulseAnimationSegue", sender: self)
        case 3:
            performSegue(withIdentifier: "TableViewAnimation", sender: self)
        case 4:
            performSegue(withIdentifier: "BounceButtonSegue", sender: self)
        default:
            return
        }
    }
    
    @IBAction func closeAnimationlist() {
        let viewController:UINavigationController = UIStoryboard(name: "List", bundle: nil).instantiateInitialViewController() as! UINavigationController
        present(viewController, animated: true, completion: nil)
    }
}
