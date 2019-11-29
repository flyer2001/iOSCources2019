//
//  ViewController.swift
//  VkDataGetter
//
//  Created by Sergey Popyvanov on 21.11.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit
let access_token = "5b6753195b6753195b675319df5b0949f255b675b67531906b27fdc08a839f51fc80389"
let fields = "photo_200_orig"

class ViewController: UIViewController {

  @IBOutlet weak var inputTextID: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var labelOutput: UILabel!
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBAction func getButton() {
    //inputTextID.resignFirstResponder()
    let inputID = inputTextID?.text
    
    activityIndicator.startAnimating()
    
    
    let url = URL(string: "https://api.vk.com/method/users.get?user_id=\(inputID ?? "360258728")&v=5.89&access_token=\(access_token)&fields=\(fields)")!
      labelOutput.numberOfLines = 2
      
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}
        guard let responseJSON = json["response"] as? [[String: Any]] else {return}
        
        guard let firstname = responseJSON.first?["first_name"] as? String else { return }
        guard let lastname = responseJSON.first?["last_name"] as? String else {return}
        guard let photo_200_orig = responseJSON[0]["photo_200_orig"] as? String else {return}
        
        let photo_200_origURL = URL(string: photo_200_orig)
        
        DispatchQueue.global(qos: .userInitiated).async {
          if let data = try? Data(contentsOf: photo_200_origURL!), let image = UIImage(data: data) {
            DispatchQueue.main.async {
              self.imageView.image = image
            }
          }
        }
        DispatchQueue.main.async {
          self.labelOutput.text = String("First name is: \(firstname)\nLast name is: \(lastname)")
          self.activityIndicator.stopAnimating()
        }
      }.resume()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }


}

