//
//  DetailsViewController.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 31/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var currentPlayer: Player?

    @IBOutlet weak var detailsTitle: UINavigationItem!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let currentPlayer = self.currentPlayer {
            nameLabel.text = currentPlayer.nome
            playerImage.image = currentPlayer.foto
            positionLabel.text = currentPlayer.posicao
            numberLabel.text = String(describing: currentPlayer.numero)
        }
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        //self.scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetailsViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.playerImage
    }
}
