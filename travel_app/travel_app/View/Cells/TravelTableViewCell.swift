//
//  TravelTableViewCell.swift
//  travel_app
//
//  Created by Franklin Carvalho on 31/12/22.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

 // MARK: - IBOutlets
    
    
    @IBOutlet weak var backgroundViewCell: UIView!
    
    @IBOutlet weak var viagemImage: UIImageView!
    
    @IBOutlet weak var tituloViagemLabel: UILabel!
    
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    
    @IBOutlet weak var diariaViagemLabel: UILabel!
    
    @IBOutlet weak var precoSemDesconto: UILabel!
    
    @IBOutlet weak var PrecoViagemLabel: UILabel!
    
    @IBOutlet weak var statusCancelamentoViagemLabel: UILabel!
}
