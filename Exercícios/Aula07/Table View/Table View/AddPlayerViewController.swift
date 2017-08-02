//
//  EditViewController.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 01/08/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
    var newPlayer: Player?

    @IBOutlet weak var nomeTF: UITextField!
    @IBOutlet weak var posicaoTF: UITextField!
    @IBOutlet weak var numeroTF: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        // se tiver com um navigation controller  só, utilizar pop
        // self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        guard let nome = self.nomeTF.text,
              let posicao = self.posicaoTF.text,
              let numeroString = self.numeroTF.text,
              let foto = self.imageView.image
            else {
                fatalError("salvando sem preencher os campos")
        }
        
        if let numero = Int(numeroString) {
            self.newPlayer = Player(nome: nome,
                                    posicao: posicao,
                                    numero: numero,
                                    foto: foto)
        }
    }
}

extension AddPlayerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Sem Imagem")
        }
        
        self.imageView.image = pickedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
}
