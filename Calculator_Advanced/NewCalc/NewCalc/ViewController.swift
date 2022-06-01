//
//  ViewController.swift
//  NewCalc
//
//  Created by Yeldos on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {
    var numbFromScreen: Double = 0
    var checkBool: Bool = false
    var checkDoubl: Bool = false;
    var firstNum: Double = 0
    var operatSign:Int = 0
    
    @IBOutlet weak var ress: UILabel!
    @IBAction func addCharDigits(_ sender: UIButton) {
        if(sender.tag == 18 && checkBool == false){
            checkDoubl = true
            ress.text = ress.text! + "."
        }else{
            if(checkBool == true){
                ress.text = String(sender.tag)
                checkBool = false;
            }else{
                ress.text = ress.text! + String(sender.tag)
            }
            numbFromScreen = Double(ress.text!) ?? 0
        }
    }
    @IBAction func operatBut(_ sender: UIButton){
        if(ress.text != "" && sender.tag != 10 && sender.tag != 15 && sender.tag != 16 && sender.tag != 17){
            firstNum = Double(ress.text!) ?? 0
            if(sender.tag == 11){
                ress.text = "/"
            }else if(sender.tag == 12){
                ress.text = "x"
            }else if(sender.tag == 13){
                ress.text = "-"
            }else if(sender.tag == 14){
                ress.text = "+"
            }
            checkDoubl = false
            checkBool = true
            operatSign = sender.tag
        }else if sender.tag == 15{
            if(operatSign == 11){
                ress.text = String(firstNum / numbFromScreen)
            }else if(operatSign == 12){
                ress.text = String(firstNum * numbFromScreen)
            }else if(operatSign == 13){
                ress.text = String(firstNum - numbFromScreen)
            }else if(operatSign == 14){
                ress.text = String(firstNum + numbFromScreen)
            }
            checkDoubl = false;
        }else if sender.tag == 10{
            ress.text = ""
            firstNum = 0
            numbFromScreen = 0
            operatSign = 0
            checkDoubl = false
        }else if sender.tag == 17{
            var temp = Double(ress.text!) ?? 0
            ress.text = String(temp * (-1))
            numbFromScreen = Double(Int(ress.text!) ?? 0)
        }else if sender.tag == 16{
            var temp = Double(ress.text!) ?? 0
            ress.text = String(temp / 100)
            numbFromScreen = Double(ress.text!) ?? 0
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

