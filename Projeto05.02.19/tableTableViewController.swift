//
//  TableViewController.swift
//  exercicioSala
//
//  Created by aluno on 10/01/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var controle = Control.instanceControl()
    var onboardingViewController: UIViewController?
    let defaults = UserDefaults.standard
    var array = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == false {
            //user is already logged in just navigate him to home screen
            if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
                present(viewController, animated: true, completion: nil)
            }
        }
        
        array = defaults.value(forKey: "TODOS") as? [String] ?? [String]()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("Itens no banco \(array.count)")
 
        print(array.count)
        return array.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("contou as sessoes")
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("listar itens na tela")
        let cell = tableView.dequeueReusableCell(withIdentifier: "meuidentificador", for: indexPath) as! myTableViewCell
        print(array[indexPath.row])
        cell.texto?.text = "\(array[indexPath.row])"
        return cell
    }
    
    // ====================================================================================================
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        array.remove(at: indexPath.row)
        defaults.set(array, forKey: "TODOS")
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
