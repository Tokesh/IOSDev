//
//  EditViewController.swift
//  IOSFinal
//
//  Created by Yeldos on 26.05.2022.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate{
    weak var viewController: ViewController?
    
    @IBOutlet weak var nameCurr: UITextField!
    @IBOutlet weak var ageCurr: UITextField!
    @IBOutlet weak var heightCurr: UITextField!
    @IBOutlet weak var profCurr: UITextField!
    
    @IBOutlet weak var SaveBut: UIButton!
    var nameTransfer = ""
    var ageTransfer = 1
    var heightTransfer = 1
    var profTransfer = ""
    var delegate: UpdateVC1?
    override func viewDidLoad() {
        super.viewDidLoad()
//        nameCurr.text = nameTransfer
//        ageCurr.text = String(ageTransfer)
//        heightCurr.text = String(heightTransfer)
//        profCurr.text = profTransfer
        nameCurr.text = currUser.name
        ageCurr.text = String(currUser.age)
        heightCurr.text = String(currUser.height)
        profCurr.text = currUser.prof
    
        // Do any additional setup after loading the view.
    }
    @IBAction func quitme(_ sender: Any) {
        delegate?.updateName(newName: nameCurr.text!, newAge: ageCurr.text!, newHeight: heightCurr.text!, newProf: profCurr.text!)
        print(delegate)
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
