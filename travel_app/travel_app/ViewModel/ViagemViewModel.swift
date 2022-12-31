//
//  ViagemViewModel.swift
//  travel_app
//
//  Created by Franklin Carvalho on 31/12/22.
//

import Foundation

enum ViagemViewModelType: String{
    case destaques
    case ofertas
    case internacionais
}

protocol ViagemViewModel {
    var tituloSessao: String {get}
    var tipo: ViagemViewModelType {get}
    var viagens: [Viagem] {get set}
    var numeroDeLinhas: Int {get}
}
