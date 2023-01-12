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
        configTableView()
        view.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
    }
    
    func configTableView(){
        travelTableView.register(UINib(nibName: "TravelTableViewCell", bundle: nil), forCellReuseIdentifier: "TravelTableViewCell")
        travelTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        travelTableView.dataSource = self
        travelTableView.delegate = self
    }
}
//MARK: UITableView extension
extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    //MARK: UITableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        switch viewModel?.tipo {
        case .destaques:
            
            guard let cellTravel = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell") as? TravelTableViewCell else {
                fatalError("Erro to create TravelTableViewCell")
            }
            
            cellTravel.configuraCelula(viewModel?.viagens[indexPath.row])
            return cellTravel
        case .ofertas:
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {
                fatalError("Error to create OfertaTableViewCell")
            }
            return celulaOferta
        default:
            return UITableViewCell()
        }
        
    }
}

//MARK: UITableViewDelegate extension
extension ViewController: UITableViewDelegate{
    //MARK: UITableViewDelegate methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self)?.first as? HomeTableViewHeader
            headerView?.configView()
            return headerView
        }
      return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 :475
        
    }
}

