//
//  ViewController.swift
//  calculator
//
//  Created by Yeldos on 28.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var num1: UITextField!
    @IBOutlet var num2: UITextField!
    @IBOutlet var boolOper: UITextField!
    @IBOutlet var calc: UIButton!
    @IBOutlet var resultView: UITextView!
    @IBOutlet var clearAll: UIButton!
    @IBOutlet var continueBut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonPressed(_ sender: Any){
        print(num1.text!)
        print(type(of: num1.text))
        print(Int(num1.text!) ?? 0)
        var firstNumber = Int(num1.text!) ?? 0
        var secondNumber = Int(num2.text!) ?? 0
        print(firstNumber + secondNumber)
        switch boolOper.text!{
        case "+": resultView.text = String(firstNumber + secondNumber)
        case "-": resultView.text = String(firstNumber - secondNumber)
        case "/": resultView.text = String(firstNumber / secondNumber)
        case "*": resultView.text = String(firstNumber * secondNumber)
        default: resultView.text = "Not recognized operation"
        }
    }
    @IBAction func clearFunc(_ sender: Any){
        num1.text = ""
        num2.text = ""
        boolOper.text = ""
        resultView.text = ""
    }
    @IBAction func continueFunc(_ sender: Any){
        num1.text = resultView.text
        num2.text = ""
        resultView.text = ""
    }

}

