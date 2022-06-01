//
//  ExpensesViewModel.swift
//  MyFinance
//
//  Created by Arman on 26.11.2021.
//

import Foundation
import UIKit
import CoreData

class IncomesViewModel: FinanceViewModelType, CoreDataCRUDProtocol {
    
    
    // MARK: For Table View
    var incomes: [Income]?
    
    var selectedRow: IndexPath?
    
    func numberOfRows() -> Int {
        return incomes?.count ?? 0
    }
    
    
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> FinanceCellViewModelType? {
        guard let income = incomes?[indexPath.row] else { return nil }
        return FinanceCellViewModel(finance: income)
    }
    
    // MARK: For Core Data
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
    
    func fetchData(tableViewHandler handler: @escaping () -> ()) {
        do {
            let request = Income.fetchRequest() as NSFetchRequest<Income>
            self.incomes = try context.fetch(request)
            DispatchQueue.main.async {
                handler()
            }
        } catch {
            
        }
        
    }
    
    func addData(title: String, category: String, amount: Int64, tableViewHandler handler: @escaping () -> ()) {
        let expense = Income(context: context)
        expense.title = title
        expense.category = category
        expense.amount = amount
        
        do {
            try context.save()
        } catch {
            
        }
        fetchData {
            handler()
        }
    }
    
    func removeData(atIndexPath indexPath: IndexPath, tableViewHandler handler: @escaping () -> ()) {
        let expenseToRemove = incomes![indexPath.row]
        
        self.context.delete(expenseToRemove)
        do {
            try context.save()
        } catch {
            
        }
        fetchData {
            handler()
        }
    }
    
    func updateData(atIndexPath indexPath: IndexPath, newTitle title: String, newCategory category: String, newAmount amount: Int64, tableViewHandler handler: @escaping () -> ()) {
        let expense = self.incomes![indexPath.row]
        
        expense.title = title
        expense.category = category
        expense.amount = amount
        
        do {
            try context.save()
        } catch {
            
        }
        fetchData {
            handler()
        }
    }
    
}

