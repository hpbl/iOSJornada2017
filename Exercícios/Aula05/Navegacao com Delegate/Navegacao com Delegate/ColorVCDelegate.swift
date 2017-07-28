//
//  ColorVCDelegate.swift
//  Navegacao com Delegate
//
//  Created by Hilton Pintor Bezerra Leite on 28/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

protocol ColorVCDelegate {
    func chosen(color: UIColor, by colorVC: ColorViewController)
}
