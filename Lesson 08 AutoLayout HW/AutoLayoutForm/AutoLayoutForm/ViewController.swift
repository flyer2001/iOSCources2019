//
//  ViewController.swift
//  AutoLayoutForm
//
//  Created by Sergey Popyvanov on 07.12.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonRegistration: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openRegistration(_ sender: Any) {
        let controller = RegistrationController()
        present(controller, animated: true)
    }
    
    
}

