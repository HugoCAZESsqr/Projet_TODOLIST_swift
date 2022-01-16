//
//  DetailViewController.swift
//  TODOS
//
//  Created by Hugo Cazes on 15/01/2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let person = data{
            det_titre.text = person.titres
            det_description.text = person.descriptions
        }
        else
        {
            det_titre.text = "ERROR"
            det_description.text = ""
        }
    }
    
    
    @IBOutlet weak var det_titre: UILabel!
    
    @IBOutlet weak var det_description: UILabel!
    
    
    var data: Menu?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController{
            vc.data = data
        }
    }
    
    @IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController{
            vc.dismiss(animated: true, completion: nil)
            print("cancel")
        }
    }
    
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController{
            if let updatedperson = vc.data{
                print("save")
                det_titre.text = updatedperson.titres
                det_description.text = updatedperson.descriptions
                
                data!.titres = updatedperson.titres
                data!.descriptions = updatedperson.descriptions
                
                
            }
        }
    }

    

}
