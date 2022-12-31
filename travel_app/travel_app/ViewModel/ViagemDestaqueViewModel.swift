//
//  ViagemDestaqueViewModel.swift
//  travel_app
//
//  Created by Franklin Carvalho on 31/12/22.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel{
    var tituloSessao: String{
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType{
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int{
        return viagens.count
    }
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
