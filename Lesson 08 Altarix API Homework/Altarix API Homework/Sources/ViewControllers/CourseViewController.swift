//
//  CourseViewController.swift
//  Altarix API Homework
//
//  Created by Sergey Popyvanov on 28.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class CourseViewController: UIViewController {
    
    var descriptionTableView = UITableView()
    var descriptionFromVC: String = ""
    var linksFromVC = List<Links>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Подробности урока"
        createTable()
    }
    
    private func createTable() {
        self.descriptionTableView = UITableView(frame: view.bounds, style: .plain)
        self.descriptionTableView.delegate = self
        self.descriptionTableView.dataSource = self
        descriptionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        descriptionTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(descriptionTableView)
    }
}

extension CourseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + linksFromVC.count  // +1 ячейка под descriptonFromVC
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = descriptionFromVC + "\n\nСсылки на материалы:"
        default:
            if indexPath.row > linksFromVC.count {break}
            cell.textLabel?.text = linksFromVC[indexPath.row - 1].title
        }
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let label = tableView.cellForRow(at: indexPath) {
            if label.textLabel?.text != nil && indexPath.row > 0 {
                showURL(linksFromVC[indexPath.row - 1].url)
        
            }
        }
    }
            
    func showURL (_ string: String) {
        if let url = URL(string: string) {
            UIApplication.shared.open(url)
        }
    }
}

