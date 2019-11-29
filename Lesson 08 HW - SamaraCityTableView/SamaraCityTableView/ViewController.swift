//
//  ViewController.swift
//  SamaraCityTableView
//
//  Created by Sergey Popyvanov on 17.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit

struct City {
  let name: String
  let yearFounding: Int
  let totalArea: Double
  let population: Int
}

class ViewController: UIViewController {
  
  var myTableView = UITableView()
  let arrayData = [City(name: "Samara", yearFounding: 1586, totalArea: 514.4, population: 1156644), City(name: "Novokuibyshevsk", yearFounding: 1951, totalArea: 263.25, population: 104279), City(name: "Tolyatti", yearFounding: 1737, totalArea: 284330, population: 707408), City(name: "Syrzan", yearFounding: 1683, totalArea: 136180, population: 172070), City(name: "Zhigulevsk", yearFounding: 1949, totalArea: 94150, population: 57687), City(name: "Kinel", yearFounding: 1837, totalArea: 108760, population: 58239)]
  let idendtifier = "MyCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createTable()
 
  }

  func createTable(){
    self.myTableView = UITableView(frame: view.bounds, style: .plain)
    self.myTableView.delegate = self
    self.myTableView.dataSource = self
    
    myTableView.register(UITableViewCell.self, forCellReuseIdentifier: idendtifier)
    myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview(myTableView)
  }
}



extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
  return arrayData[section].name
  }


  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50.0
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return arrayData.count
  }
 
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: idendtifier, for: indexPath)
    //cell.textLabel?.text = "section \(indexPath.section) row \(indexPath.row)"
    switch indexPath.row {
    case 0:
      cell.textLabel?.text = "Founding in \(arrayData[indexPath.section].yearFounding)"
    case 1:
      cell.textLabel?.text = "Total Area is \(arrayData[indexPath.section].totalArea)"
    case 2:
      cell.textLabel?.text = "Population is \(arrayData[indexPath.section].population)"
    default:
      break
    }
    
    return cell
  }
  
  
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70.0
  }
  

}
