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


