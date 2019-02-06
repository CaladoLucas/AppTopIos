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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
            present(viewController, animated: true, completion: nil)
        }

    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        // landscape
        //        if newCollection.verticalSizeClass == .compact {
        //            buttonTopConstraint.constant = 200
        //        } else {
        //            buttonTopConstraint.constant = 24
        //        }
        
        if newCollection.verticalSizeClass == .compact {
            onboardingViewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController()
            present(onboardingViewController!, animated: true, completion: nil)
        } else {
            onboardingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Itens no banco \(controle.selecionarItens().count)")
        return controle.selecionarItens().count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("contou as sessoes")
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("listar itens na tela")
        let cell = tableView.dequeueReusableCell(withIdentifier: "meuidentificador", for: indexPath) as! myTableViewCell
        
        print("\(controle.selecionarItens()[indexPath.row])")
        cell.texto?.text = "\(controle.selecionarItens()[indexPath.row])"
        return cell
    }
    
    // ====================================================================================================
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && controle.isAdmin {
            controle.deletar(item: controle.selecionarItens()[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            let alert = UIAlertController(title: "Aviso", message:"Somente ADMs Podem Apagar", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
