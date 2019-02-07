//
//  TableViewController.swift
//  exercicioSala
//
//  Created by aluno on 10/01/19.
//  Copyright © 2019 CESAR. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var onboardingViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == false {
            //user is already logged in just navigate him to home screen
            if let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as? OnboardingViewController {
                present(viewController, animated: true, completion: nil)
            }
        }

        

    }
    
}
