//
//  ViewController.swift
//  Altarix API Homework
//
//  Created by Sergey Popyvanov on 26.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items: [Item] = []
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIServices.shared.getObject(method: APIServices.eventMethod, params: ["id" : "F95908B6-492E-4D4A-B780-66E9DFE413E4"])
        {[weak self] (result : Cource?, error: Error?) in
            if let error = error {
                print("\(error)")
            } else if let result = result {
                //print("\(result)")
                self?.update(from: result)
            }
        }
    }


    private func update(from result: Cource) {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        navigationItem.title = result.event.title
        items = result.event.dayes.compactMap { day in
            return day.items.first
        }
        tableView.reloadData()
        activityIndicator.stopAnimating()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC: CourseViewController = segue.destination as? CourseViewController {
            let index = tableView.indexPathForSelectedRow?.row
            if index != nil {
                destinationVC.descriptionFromVC = items[index!].itemDescription
                destinationVC.linksFromVC = items[index!].links
            }
        }
    }


}
