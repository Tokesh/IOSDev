//
//  ExpensesCellView.swift
//  MyFinance
//
//  Created by Arman on 26.11.2021.
//

import UIKit

class ExpensesCellView: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    weak var viewModel: FinanceCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            descriptionLabel.text = viewModel.description
            amountLabel.text = viewModel.amount
        }
    }
}
