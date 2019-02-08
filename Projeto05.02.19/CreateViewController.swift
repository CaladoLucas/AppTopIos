//
//  CreateViewController.swift
//  Projeto05.02.19
//
//  Created by aluno on 07/02/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var todoText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveData(_ sender: Any) {
        print(Model.name)
        
        var array = [String]()
        
        array = defaults.value(forKey: "TODOS") as? [String] ?? [String]()

        array.append(todoText.text ?? "")
        
        
        defaults.set(array, forKey: "TODOS")
       
    
   }
}
