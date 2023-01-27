//
//  OfertaTableViewCell.swift
//  AluraViagens
//
//  Created by Franklin Carvalho on 13/03/21.
//

import UIKit

protocol OfertaTableViewCellDelegate: AnyObject {
    func didSelectView(_ viagem: Viagem?)
}

class OfertaTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagemLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    weak var delegate: OfertaTableViewCellDelegate?
    private var viagens: [Viagem]?
    
    func configuraCelula(_ viagens: [Viagem]?) {
        self.viagens = viagens
        guard let listaDeViagem = viagens else { return }
        
        for i in 0..<listaDeViagem.count {
            setOutlets(i, viagem: listaDeViagem[i])
        }
        
        fundoViews.forEach { viewAtual in
            viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectView(_:))))
            viewAtual.addSombra()
        }
    }
    
    func setOutlets(_ index: Int, viagem: Viagem) {
        let imageOutlet = viagemImages[index]
        imageOutlet.image = UIImage(named: viagem.asset)
        
        let tituloOutlet = tituloViagemLabels[index]
        tituloOutlet.text = viagem.titulo
        
        let subtituloOutlet = subtituloViagemLabels[index]
        subtituloOutlet.text = viagem.subtitulo
        
        let precoSemDescontoOutlet = precoSemDescontoLabels[index]
        precoSemDescontoOutlet.text = "A partir de R$ \(viagem.precoSemDesconto)"
        
        let precoOutlet = precoLabels[index]
        precoOutlet.text = "R$ \(viagem.preco)"
    }
    
    @objc func didSelectView(_ gesture: UIGestureRecognizer){
        if let selectedView = gesture.view{
            let viagemSelecionada = viagens?[selectedView.tag]
            delegate?.didSelectView(viagemSelecionada)
        }
    }
}
