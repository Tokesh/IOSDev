//
//  loginViewController.swift
//  Lab-Login(Segues)
//
//  Created by Yeldos on 07.04.2022.
//

import Foundation
import UIKit

class loginViewController: UIViewController {
    @IBOutlet var MyButton: UIButton!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func segueT(_ sender: Any) {
        if(username.text == "admin" && password.text == "admin"){
            let MainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            guard let destinationViewController = MainStoryBoard.instantiateViewController(withIdentifier: "destinationViewController") as? destinationViewController else{
                print("Coudn't find it")
                return
            }
            navigationController?.pushViewController(destinationViewController, animated: true)
        }
        
    }

}
