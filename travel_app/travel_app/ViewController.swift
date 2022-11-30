//
//  ViewController.swift
//  travel_app
//
//  Created by Franklin Carvalho on 22/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var travelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        travelTableView.dataSource = self
        travelTableView.delegate = self
        view.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
    }
}
//MARK: UITableView extension
extension ViewController: UITableViewDataSource{
    
    //MARK: UITableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "travel \(indexPath.row)"
        return cell
    }
}

//MARK: UITableViewDelegate extension
extension ViewController: UITableViewDelegate{
    //MARK: UITableViewDelegate methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)?.first as? HomeTableViewHeader
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}

