//
//  CreateViewController.swift
//  Projeto05.02.19
//
//  Created by aluno on 07/02/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var todoText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveData(_ sender: Any) {
        print(todoText.text!)
    }
    
   }
