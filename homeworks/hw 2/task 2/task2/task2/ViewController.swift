//
//  ViewController.swift
//  task2
//
//  Created by Yeldos on 27.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var greet: UIButton!
    @IBOutlet weak var printMe: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonPressed(_ sender: Any){
        printMe.text = "Have a good day \(userName.text!)!"
    }


}

