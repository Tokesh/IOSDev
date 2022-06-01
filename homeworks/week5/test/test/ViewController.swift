//
//  ViewController.swift
//  test
//
//  Created by Torekeldi on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var MyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(MyButton.currentTitleColor)
        MyButton.setTitleColor(.red, for:.normal)
        print(MyButton.currentTitleColor)
        MyButton.setTitle("Test", for: .normal)
        print(MyButton.currentTitle as Any)
        MyButton.tintColor = .green
    }
    @IBAction func buttonPressed(_ sender: Any){
        print("The Button was pressed")
    }
}

