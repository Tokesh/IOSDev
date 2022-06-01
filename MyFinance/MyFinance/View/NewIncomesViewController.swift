//
//  NewIncomesViewController.swift
//  MyFinance
//
//  Created by Arman on 19.02.2022.
//

import UIKit
import CoreData


class NewIncomesViewController: UIViewController {
    
    @IBOutlet weak var titleTf: UITextField!
    @IBOutlet weak var categoryTf: UITextField!
    @IBOutlet weak var amountTf: UITextField!
    
    var editingStyle: EditingStyle!
    var currentIncome: Income!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
    }
    
    // MARK: Save to Core Data
    func addData(title: String, category: String, amount: Int64) {
        let income = Income(context: context)
        income.title = title
        income.category = category
        income.amount = amount
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    func setupEditScreen() {
        if currentIncome != nil {
            setupNavigationBar()
            titleTf.text = currentIncome.title
            categoryTf.text = currentIncome.category
            amountTf.text = "\(currentIncome.amount)"
        }
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = currentIncome.title
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        switch editingStyle {
        case .edit:
            let income = currentIncome
            income?.title = titleTf.text
            income?.category = categoryTf.text
            income?.amount = Int64(amountTf.text!) ?? 0
            
            do {
                try self.context.save()
            } catch {
                
            }
            dismiss(animated: true, completion: nil)
        case .add:
            guard let title = titleTf.text, let category = categoryTf.text, title != "", category != "" else {return}
            
            if amountTf.text == nil || amountTf.text == "" {
                amountTf.text = "0"
            }
            guard let intVal = Int64(amountTf.text!) else { return }
            addData(title: title, category: category, amount: intVal)
            dismiss(animated: true, completion: nil)
        case .none:
            break
        }
    }
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
