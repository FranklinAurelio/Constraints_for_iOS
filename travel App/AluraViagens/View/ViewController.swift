//
//  ViewController.swift
//  AluraViagens
//
//  Created by Franklin Carvalho on 13/03/21.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    var selectPackage: Viagem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    func configuraTableView() {
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }
    
    func irParaDetalhe(_ viagem: Viagem?){
        
        if let viagemSelecionada = viagem {
            selectPackage = viagemSelecionada
            
            let detalheController = DetalheViewController.instanciar(viagemSelecionada)
            
            navigationController?.pushViewController(detalheController, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return secaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = secaoDeViagens?[indexPath.section]
        //let x = UICollectionView.layoutAttributesForItem(at: indexPath)
        switch viewModel?.tipo {
        case .destaques:
            
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {
                fatalError("error to create ViagemTableViewCell")
            }
            
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            
            return celulaViagem
            
        case .ofertas:
            
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {
                fatalError("error to create OfertaTableViewCell")
            }
            
            celulaOferta.delegate = self
            celulaOferta.configuraCelula(viewModel?.viagens)
            
            return celulaOferta
            
        default:
            return UITableViewCell()
        }
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewModel = secaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques, .internacionais:
            let viagemSelecionada = viewModel?.viagens[indexPath.row]
            irParaDetalhe(viagemSelecionada)
        default:
            break
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            
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
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
}

extension ViewController: OfertaTableViewCellDelegate{
    func didSelectView(_ viagem: Viagem?) {
        irParaDetalhe(viagem)
    }
    
    // MARK: - UINavigationControllerDelegate
    /*func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let imagePath = selectPackage?.asset else {return nil}
        
        guard let image = UIImage(named: imagePath) else {return nil}
        
        switch operation {
        case .push:
            return AnimationCustom(duration: 0.5, image: image, initialFrame: <#T##CGRect#>)
        default:
            break
        }
    }*/
}


