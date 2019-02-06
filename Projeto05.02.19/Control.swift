//
//  control.swift
//  exercicioSala
//
//  Created by aluno on 10/01/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import Foundation

class Control {
    
    static let sharedControl = Control()
    
    private init(){}
    
    var base = Database.instance()
    var isAdmin = false
    
    func inserirTexto(value: String) {
        base.insert(add: value)
    }
    
    func selecionarItens() -> Array<String> {
        return base.list()
    }
    
    func deletar(item: String){
        return base.delete(add: item)
    }
    
    static func instanceControl() -> Control {
        return self.sharedControl
    }
}
