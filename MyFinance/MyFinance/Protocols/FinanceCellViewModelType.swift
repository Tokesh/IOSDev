//
//  ExpensesCellViewModelType.swift
//  MyFinance
//
//  Created by Arman on 26.11.2021.
//

import Foundation

protocol FinanceCellViewModelType: AnyObject {
    var description: String { get }
    var amount: String { get }
}
