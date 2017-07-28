//
//  ColorViewController.swift
//  Navegacao com Delegate
//
//  Created by Hilton Pintor Bezerra Leite on 28/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    var delegate: ColorVCDelegate?
    var colorString: String?

    @IBAction func chooseColor(_ sender: UIButton) {
        self.selectedColorLbl.text = sender.backgroundColor?.descricao
    }
    
    @IBAction func saveColor(_ sender: Any) {
        guard let delegate = self.delegate,
              let chosenColor = self.selectedColorLbl.text?.cor
        else {
            return
        }
        
        delegate.chosen(color: chosenColor, by: self)
    }
    
    @IBOutlet weak var selectedColorLbl: UILabel!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.blackBtn.backgroundColor = UIColor.black
        self.redBtn.backgroundColor = UIColor.red
        self.greenBtn.backgroundColor = UIColor.green
        
        self.selectedColorLbl.text = colorString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
