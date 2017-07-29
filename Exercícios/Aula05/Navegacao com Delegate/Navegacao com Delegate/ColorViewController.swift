//
//  ColorViewController.swift
//  Navegacao com Delegate
//
//  Created by Hilton Pintor Bezerra Leite on 28/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    // propriedade delegate do tipo do protocolo
    var delegate: ColorVCDelegate?
    // propriedade para guardar a cor atual
    var colorString: String?
    // action chamada quando apertar qualquer um dos 3 botões
    @IBAction func chooseColor(_ sender: UIButton) {
        // atribui a descricao da cor do botão ao label
        self.selectedColorLbl.text = sender.backgroundColor?.descricao
    }
    // action cahamda quando apertar o botão de save
    @IBAction func saveColor(_ sender: Any) {
        // binding do delegate e da cor escolhida ao mesmo tempo
        guard let delegate = self.delegate,
              let chosenColor = self.selectedColorLbl.text?.cor
        else {
            return
        }
        // chama método chosen do delegate repassando a cor escolhida e uma referencia a si
        delegate.chosen(color: chosenColor, by: self)
    }
    // elementos da GUI
    @IBOutlet weak var selectedColorLbl: UILabel!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // atribui as cores certas aos botões
        self.blackBtn.backgroundColor = UIColor.black
        self.redBtn.backgroundColor = UIColor.red
        self.greenBtn.backgroundColor = UIColor.green
        
        // atribui a cor atual ao label
        self.selectedColorLbl.text = colorString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
