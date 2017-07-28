//
//  MainViewController.swift
//  Navegacao com Delegate
//
//  Created by Hilton Pintor Bezerra Leite on 28/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var escolherCorBtn: UIButton!
    @IBOutlet weak var corAtualLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destino = segue.destination as? ColorViewController else {
            return
        }
        
        destino.delegate = self
        destino.colorString = self.corAtualLbl.text
    }

}

extension MainViewController: ColorVCDelegate {
    func chosen(color: UIColor, by colorVC: ColorViewController) {
        guard let selectedColor = color.descricao else {
            return
        }
        
        self.corAtualLbl.text = selectedColor
        self.view.backgroundColor = selectedColor.cor
        
        self.navigationController?.popViewController(animated: true)
    }
}
