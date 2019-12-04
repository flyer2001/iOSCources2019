//
//  ViewController.swift
//  ActionButton
//
//  Created by Sergey Popyvanov on 04.12.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 1
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func pressButton(_ sender: Any) {
        textLabel.text = "You press button \(count) times"
        count += 1
    }
    
}

