//
//  ViewController.swift
//  Altarix API Homework
//
//  Created by Sergey Popyvanov on 26.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UITableViewController {
   
    var events = Event()
    var items: [Item] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var refreshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        //Получаем кэш из базы Realm
        if let cacheRealmDB = DB.shared.realm.objects(Cource.self).first{
            refreshButton.setTitle(cacheRealmDB.event?.title ?? "Загрузить", for: .normal)
            items = eventArrayToItemConvert(cacheRealmDB.event)
        }

        tableView.reloadData()
        activityIndicator.stopAnimating()
    }

    @IBAction func refreshButton(_ sender: Any) {
    
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
    
    private func eventArrayToItemConvert (_ event: Event?) -> [Item] {
        guard let event = event else {return []}
        let newItems = Array(event.dayes)
        return newItems.compactMap{$0.items.first}
    }
    
    private func update(from result: Cource) {
        activityIndicator.startAnimating()

        //Сохранение в Realm
        DB.shared.realm.beginWrite()
        DB.shared.realm.deleteAll()  //чистим базу, чтобы не пухла база, нам актуально только последнее обновление
        DB.shared.realm.add(result)
        try! DB.shared.realm.commitWrite()
        
        if let titleCource = result.event?.title {
            refreshButton.setTitle(titleCource, for: .normal)
            if let newEvent = result.event {
                let newItems = Array(newEvent.dayes)
                items = newItems.compactMap{$0.items.first}
            }
        tableView.reloadData()
        activityIndicator.stopAnimating()
        }
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
