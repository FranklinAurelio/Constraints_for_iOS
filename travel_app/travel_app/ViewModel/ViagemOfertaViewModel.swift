//
//  ViagemOfertaViewModel.swift
//  travel_app
//
//  Created by Franklin Carvalho on 12/01/23.
//

import Foundation
class ViagemOfertaViewModel :ViagemViewModel{
    var tituloSessao: String{
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType{
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int{
        return 1
    }
    
    // MARK: -Initializer
    
    init(viagens: [Viagem]) {
        self.viagens = viagens
    }
    
    
}
