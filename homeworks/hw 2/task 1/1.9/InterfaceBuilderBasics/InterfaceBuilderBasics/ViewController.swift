//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Yeldos on 27.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myLabel: UILabel!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func changeTitle(_ sender: Any){
        myLabel.text = "This app rocks!"
    }

}

