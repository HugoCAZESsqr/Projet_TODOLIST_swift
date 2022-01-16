//
//  EditViewController.swift
//  TODOS
//
//  Created by Hugo Cazes on 16/01/2022.
//

import UIKit

class EditViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let person = data{
            editTitre.text = person.titres
            editDescription.text = person.descriptions
            
        }
        editTitre.delegate = self
        editDescription.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        data!.titres = editTitre.text!
        data!.descriptions = editDescription.text!
        
        return true
    }
    
    
    @IBOutlet weak var editTitre: UITextField!
    
    @IBOutlet weak var editDescription: UITextField!
    
    var data: Menu?
}
