//
//  ViewController.swift
//  Aula04
//
//  Created by Hilton Pintor Bezerra Leite on 27/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorBtn: UIButton!
    @IBOutlet weak var colorTextField: UITextField!

    @IBAction func changeColor(_ sender: Any) {
        var novaCor: UIColor
        
        switch self.colorTextField.text! {
        case "Red":
            novaCor = UIColor.red
        case "Black":
            novaCor = UIColor.black
        default:
            self.colorTextField.text = "Cor inválida"
            novaCor = UIColor.clear
        }
        
        self.view.backgroundColor = novaCor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.colorBtn.isEnabled = false
        
        self.colorTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let texto = textField.text else {
            return true
        }
        
        if texto != ""{
            self.colorBtn.isEnabled = true
        }
        return true
    }
}


