//
//  DetailViewController.swift
//  IOSFinal
//
//  Created by Yeldos on 25.05.2022.
//

import UIKit

protocol UpdateVC1 {
    func updateName(newName: String, newAge:String, newHeight:String, newProf: String)
}

class currUser{
    static var name = ""
    static var age = 1
    static var height = 1
    static var prof = ""
}


class DetailViewController: UIViewController,UpdateVC1 {

    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var ageText: UILabel!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var profText: UILabel!
    
    var namerr = ""
    var agerr = 1
    var heightrr = 1
    var profrr = ""
    var updt = false
    
    @IBOutlet weak var editBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailText.text = "Name: " + namerr
        ageText.text = "Age: " + String(agerr)
        heightText.text = "Height: " + String(heightrr)
        profText.text = "Profession: " + profrr
        
        currUser.name = namerr
        currUser.age = agerr
        currUser.height = heightrr
        currUser.prof = profrr
        // Do any additional setup after loading the view.
    }
    
    @IBAction func transferEdit(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController{
            vc.nameTransfer = namerr ?? "None"
            vc.ageTransfer = agerr
            vc.heightTransfer = heightrr
            vc.profTransfer = profrr
            self.navigationController?.showDetailViewController(vc, sender: (Any).self)
            //self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? EditViewController {
            destination.delegate = self
        }
    }
    func updateName(newName: String, newAge:String, newHeight:String, newProf: String) {
        print(detailText)
        detailText.text = "Name: " + newName
        ageText.text = "Age: " + String(newAge)
        heightText.text = "Height: " + String(newHeight)
        profText.text = "Proffesion: " + newProf
        
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
