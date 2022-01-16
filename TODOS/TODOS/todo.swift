//
//  Todo.swift
//  TODOS
//
//  Created by Hugo Cazes on 15/01/2022.
//


import Foundation

class Todo : Codable {
    var todo: [Menu]
    
    init(todo: [Menu]){
        self.todo = todo
    }
}

class Menu: Codable{
    
    
    var titres : String
    var descriptions : String
    
    init(titres: String, descriptions: String) {
        self.titres = titres
        self.descriptions = descriptions
    }
    
    
}

