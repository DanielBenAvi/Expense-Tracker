//
//  Expence.swift
//  Expense Tracker
//
//  Created by דניאל בן אבי on 31/05/2024.
//

import Foundation

class Expence {
    var title: String
    var amount: Double
    var date: Date
    var category: Category
    
    init(title: String, amount: Double, date: Date, category: Category) {
        self.title = title
        self.amount = amount
        self.date = date
        self.category = category
    }
    
    func printExpence() {
        print("Title: \(title), Amount: \(amount), Date: \(date), Category: \(category)")
    }
}
