//
//  Extensions.swift
//  Navegacao com Delegate
//
//  Created by Hilton Pintor Bezerra Leite on 28/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

extension UIColor {
    var descricao: String? {
        switch self {

        case UIColor.red:
            return "Vermelho"
        
        case UIColor.green:
            return "Verde"
            
        case UIColor.black:
            return "Preto"
            
        default:
            return nil
        }
    }
}

extension String {
    var cor: UIColor? {
        switch self {

        case "Vermelho":
            return UIColor.red
            
        case "Verde":
            return UIColor.green
            
        case "Preto":
            return UIColor.black
            
        default:
            return nil
        }
    }
}
