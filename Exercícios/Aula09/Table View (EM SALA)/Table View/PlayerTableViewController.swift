//
//  PlayerTableViewController.swift
//  Table View
//
//  Created by Hilton Pintor Bezerra Leite on 31/07/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit
import CoreData

class PlayerTableViewController: UITableViewController {
    var players: [JogadorMO] = []

    var appDelegate: AppDelegate!
    var context: NSManagedObjectContext!
    var request: NSFetchRequest<JogadorMO>!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        self.request = JogadorMO.fetchRequest()
        
        self.loadPlayers()
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
        
        cell.playerImageView.image = UIImage(data: currentPlayer.foto! as Data)
        cell.playerNameLabel.text = currentPlayer.nome!
        cell.playerPositionLabel.text = currentPlayer.posicao!
        cell.playerNumberPosition.text = "#" + String(currentPlayer.numero)

        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            let deletedPlayer = self.players[indexPath.row]
            self.context.delete(deletedPlayer)
            self.appDelegate.saveContext()
            
            self.loadPlayers()
        }
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
            break
            //fatalError("Identificador da segue desconhecido")
        }
        
    }
    
    @IBAction func unwindToPlayersList(sender: UIStoryboardSegue) {
        guard let addVC = sender.source as? AddPlayerViewController else {
            return
        }
        
        guard let newPlayer = addVC.newPlayer else {
            return
        }
        
        do {
            try self.context.save()
            self.players.append(newPlayer)
            self.tableView.reloadData()
        } catch {
            print("erro no salvamento \(error.localizedDescription)")
        }
    }
    
    
    // MARK: - Cell Setup
    private func loadPlayers() {
        // fetch players from coreData
        do {
            try self.players = self.context.fetch(self.request)
            self.tableView.reloadData()
        } catch {
            print("Erro no fetch: \(error.localizedDescription)")
        }
    }

}
