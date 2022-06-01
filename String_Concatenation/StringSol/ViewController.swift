//
//  ViewController.swift
//  StringSol
//
//
import UIKit

class ViewController: UIViewController {
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

