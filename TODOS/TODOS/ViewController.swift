//
//  ViewController.swift
//  TODOS
//
//  Created by Hugo Cazes on 15/01/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var data: [Menu] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContent", for: indexPath) as! TableViewCell

        let row = indexPath.row
    
        cell.Titre.text = data[row].titres
        


        return cell
    }
    
    


   

    
    override func viewDidLoad() {
        super.viewDidLoad()


            
            data.append(Menu(titres: "Faire les courses", descriptions: "Acheter du lait, du thé..."))
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.data.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
            
        })
        ])
        return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController{
            let row = tableview.indexPathForSelectedRow!.row
            vc.data = data[row]
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
    }
    
    
    @IBAction func ajout(_ unwindSegue: UIStoryboardSegue) {
        let ajouter = unwindSegue.source as! AjoutViewController
        if unwindSegue.identifier == "cancel"{
            print("cancel")
            ajouter.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save"{
            if let titre = ajouter.ajoutTitre.text, let description = ajouter.ajoutDescription.text{
                let ndata = Menu(titres: titre, descriptions: description)
                print("save")
                
                data.append(ndata)
                tableview.reloadData()
            }
        }
    }
}
