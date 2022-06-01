//
//  StringViewController.swift
//  TabBar
//
//  Created by Yeldos on 19.04.2022.
//

import UIKit

class StringViewController: UIViewController {

    @IBOutlet var s1: UITextField!
    @IBOutlet var s2: UITextField!
    @IBOutlet var res: UITextView!
    @IBOutlet var buts: UIButton!
    @IBOutlet var clearAll: UIButton!
    @IBOutlet var continueC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func butPressed(_ sender: Any){
        res.text = "\(s1.text!)\(s2.text!)"
    }
    @IBAction func clearEv(_ sender: Any){
        res.text = ""
        s1.text = ""
        s2.text = ""
    }
    @IBAction func continueEv(_ sender: Any){
        s1.text = res.text
        s2.text = ""
        res.text = ""
    }

}
