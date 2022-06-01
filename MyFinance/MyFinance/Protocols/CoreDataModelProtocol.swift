//
//  CoreDataModelProtocol.swift
//  MyFinance
//
//  Created by Arman on 19.02.2022.
//

import Foundation

protocol CoreDataModelProtocol {
    var amount: Int64 { get }
    var category: String? { get }
    var title: String? { get }
}
