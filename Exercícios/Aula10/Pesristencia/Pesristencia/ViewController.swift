//
//  ViewController.swift
//  Pesristencia
//
//  Created by Hilton Pintor Bezerra Leite on 02/08/17.
//  Copyright © 2017 hpbl. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var pessoas = [PessoaMO]()
    var appDelegate: AppDelegate!
    var managedContext: NSManagedObjectContext!

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addNome(_ sender: Any) {
        let alert = UIAlertController(title: "Nova Pessoa", message: "Adicione uma nova pessoa", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { (action) in
            guard let textField = alert.textFields?.first,
                let novoNome = textField.text else {
                    fatalError("nome inválido")
            }
            
            self.save(novoNome: novoNome)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func save(novoNome: String) {
        //let entity = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext!)
        
        //let pessoa = NSManagedObject(entity: entity!, insertInto: managedContext)
        
//        let img = #imageLiteral(resourceName: "diego")
//        let imgData = UIImageJPEGRepresentation(img, 1)
//        
//        pessoa.setValue(imgData, forKey: "foto")
//        
//        pessoa.setValue(novoNome, forKey: "nome")
        
        let novaPessoa = PessoaMO(context: self.managedContext)
        novaPessoa.foto = NSData(data: UIImageJPEGRepresentation(#imageLiteral(resourceName: "diego"), 1)!)
        novaPessoa.nome = novoNome
        
        do {
            try managedContext?.save()
            self.pessoas.append(novaPessoa)
        } catch let error as NSError {
            print("erro na hora de salvar. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false

        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedContext = appDelegate?.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest: NSFetchRequest<PessoaMO> = PessoaMO.fetchRequest()
        
        
        do {
            try self.pessoas = (self.managedContext.fetch(fetchRequest))
            self.tableView.reloadData()
        } catch let error as NSError {
            print("erro na hora de pedir. \(error), \(error.userInfo)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let pessoa = pessoas[indexPath.row]
        
        cell.textLabel?.text = pessoa.value(forKey: "nome") as? String

        
        guard let imgData = pessoa.value(forKey: "foto") as? Data,
              let image = UIImage(data: imgData) else {
            return cell
        }
        
        cell.imageView?.image = image

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let pessoa = self.pessoas[indexPath.row]
            self.managedContext?.delete(pessoa)
            self.appDelegate?.saveContext()
            
            let fetchRequest: NSFetchRequest<PessoaMO> = PessoaMO.fetchRequest()

            
            do {
                try self.pessoas = self.managedContext.fetch(fetchRequest)
                tableView.reloadData()
            } catch {
                print("Fetching Failed")
            }
        }
    }
}

