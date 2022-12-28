//
//  HomeTableViewHeader.swift
//  travel_app
//
//  Created by Franklin Carvalho on 30/11/22.
//

import UIKit

class HomeTableViewHeader: UIView {

   //MARK: -IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var bannerView: UIView!
    func configView(){
        headerView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        
        headerView.layer.cornerRadius = 500
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
}
