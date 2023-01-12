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
    
    func configuraCelula(_ viagem:Viagem?){
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        PrecoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        
        precoSemDesconto.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes{
            let diarias = numeroDeDias == 1 ? "Diária":"Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa": "Pessoas"
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) \(numeroDeHospedes) \(hospedes)"
        }
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
    }
}
