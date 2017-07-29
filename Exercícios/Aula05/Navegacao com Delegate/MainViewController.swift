//
//  MainViewController.swift
//  Navegacao com Delegate
//
//  Created by Hilton Pintor Bezerra Leite on 28/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //Elementos da GUI
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
    
    // método que vai ser chamado quando a segue for ser executada
    // no caso, quando for pra o ColorViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // binding do segue.destination, que retorna um UIViewController (para onde a segue vai)
        // downcasting para ColorViewController
        guard let destino = segue.destination as? ColorViewController else {
            return
        }
        // indica que o delegate do ColorViewController é o MainViewController (self)
        destino.delegate = self
        // atualiza o conteúdo da label do ColorViewController
        destino.colorString = self.corAtualLbl.text
    }

}

// extensão para aderir ao protocolo ColorVCDelegate
extension MainViewController: ColorVCDelegate {
    // implementação da função do protocolo
    func chosen(color: UIColor, by colorVC: ColorViewController) {
        // binding de color.descricao (retorna uma string que diz qual é a cor)
        guard let selectedColor = color.descricao else {
            return
        }
        // atualiza a GUI de acordo com a cor  escolhida
        self.corAtualLbl.text = selectedColor
        self.view.backgroundColor = selectedColor.cor
        
        // retira colorVC da pilha de navegação
        colorVC.navigationController?.popViewController(animated: true)
    }
}
