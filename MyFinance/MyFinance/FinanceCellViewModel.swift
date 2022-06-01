//
//  ExpensesCellViewModel.swift
//  MyFinance
//
//  Created by Arman on 26.11.2021.
//

import Foundation
 
class FinanceCellViewModel: FinanceCellViewModelType {
    private var finance: CoreDataModelProtocol
    
    var description: String {
        if let title = finance.title, let category = finance.category {
            return "Title: \(title)     Category: \(category)"
        }
        return "Title: nil    Category: nil"
    }
    
    var amount: String {
        return "\(finance.amount)"
    }
    
    init<T: CoreDataModelProtocol>(finance: T) {
        self.finance = finance
    }
}
