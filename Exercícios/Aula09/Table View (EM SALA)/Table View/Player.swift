//
//  Player.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 31/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class Player {
    var nome: String
    var posicao: String
    var numero: Int
    var foto: UIImage

    init(nome: String, posicao: String, numero: Int, foto: UIImage) {
        self.nome = nome
        self.posicao = posicao
        self.numero = numero
        self.foto = foto
    }
}
