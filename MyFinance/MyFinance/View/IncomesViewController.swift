//
//  IncomesViewController.swift
//  MyFinance
//
//  Created by Arman on 26.11.2021.
//

import UIKit

class IncomesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    private var viewModel: IncomesViewModel?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = IncomesViewModel()
        viewModel?.fetchData {
            self.tableView.reloadData()
        }
    }
    
    func ownFetch() {
        viewModel?.fetchData {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.fetchData {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.incomes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell", for: indexPath) as? IncomesCellView
        guard let tableViewCell = cell else { return UITableViewCell() }
        let income = viewModel?.incomes?[indexPath.row]
        tableViewCell.descriptionLabel.text = "Title: \(income?.title ?? "")     Category: \(income?.category ?? "")"
        tableViewCell.amountLabel.text = "Amount: \(income!.amount)"
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            // TODO: delete from viewModel implemetation
            self.viewModel?.removeData(atIndexPath: indexPath) {
                self.tableView.reloadData()
            }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    @IBAction func showBalance(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Your balance is:", message: TotalBalanceCount().calculate(), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditIncome" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let income = self.viewModel?.incomes?[indexPath.row]
            let newIncome = segue.destination as! NewIncomesViewController
            newIncome.currentIncome = income
            newIncome.editingStyle = .edit
        }
        
        if segue.identifier == "NewIncome" {
            let newExpense = segue.destination as! NewIncomesViewController
            newExpense.editingStyle = .add
        }
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
}
