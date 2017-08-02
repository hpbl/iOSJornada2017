//
//  PlayerTableViewController.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 31/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    var players: [Player] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.loadPlayers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return self.players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlayerCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell else {
            fatalError("Tipo de célula não é PlayerTableViewCell")
        }

        // Configure the cell...
        let currentPlayer = self.players[indexPath.row]
        
        cell.playerImageView.image = currentPlayer.foto
        cell.playerNameLabel.text = currentPlayer.nome
        cell.playerPositionLabel.text = currentPlayer.posicao
        cell.playerNumberPosition.text = "#" + String(currentPlayer.numero)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } /*else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        
        switch segueIdentifier {
            
        case "showDetailsVC":
            guard let destinationVC = segue.destination as? DetailsViewController else {
                fatalError("showDetalhe segue com destino de tipo inesperado")
            }
            
            guard let selectedCell = sender as? PlayerTableViewCell else {
                fatalError("célula selecionada é de tipo inesperado")
            }
            
            guard let selectedIndexPath = self.tableView.indexPath(for: selectedCell) else {
                fatalError("célula selecionada não está sendo mostrada")
            }
            
            let selectedPlayer = self.players[selectedIndexPath.row]
            destinationVC.currentPlayer = selectedPlayer
            
        default:
            fatalError("Identificador da segue desconhecido")
        }
        
    }
    
    @IBAction func unwindToPlayersList(sender: UIStoryboardSegue) {
        guard let addVC = sender.source as? AddPlayerViewController else {
            return
        }
        
        guard let newPlayer = addVC.newPlayer else {
            return
        }
        
        //new index for the player
        let newIndexPath = IndexPath(row: players.count, section: 0)

        //updating data source
        players.append(newPlayer)
        
        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    
    // MARK: - Cell Setup
    private func loadPlayers() {
        // create player objects
        let diegoSouza = Player(nome: "Diego Souza", posicao: "Meia", numero: 87, foto: #imageLiteral(resourceName: "diego"))
        let magrao = Player(nome: "Magrão", posicao: "Goleiro", numero: 1, foto: #imageLiteral(resourceName: "magrao"))
        let durval = Player(nome: "Durval", posicao: "Zagueiro", numero: 4, foto: #imageLiteral(resourceName: "durval"))
        
        // add them to players property
        players.append(contentsOf: [diegoSouza, magrao, durval])
    }

}
