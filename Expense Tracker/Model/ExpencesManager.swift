//
//  ExpencesManager.swift
//  Expense Tracker
//
//  Created by דניאל בן אבי on 31/05/2024.
//

import Foundation

class ExpencesManager {
    
    static let shared = ExpencesManager(totalAmount: 0.0, expences: [])
    
    var totalAmount: Double
    var expences: [Expence]
    
    private init(totalAmount: Double, expences: [Expence]) {
        self.totalAmount = totalAmount
        self.expences = expences
    }
    
    func addExpence(expence: Expence) {
        // Add the expence to the expences array
        expences.append(expence)
        // Subtract the expence amount from the total amount
        totalAmount -= expence.amount
        
        // Print the new total amount
        print("New total amount: \(totalAmount)")
    }
    
    func removeExpence(at index: Int) {
        // Get the expence at the specified index
        let expence = expences[index]
        // Remove the expence from the expences array
        expences.remove(at: index)
        // Add the expence amount back to the total amount
        totalAmount += expence.amount
        
        // Print the new total amount
        print("New total amount: \(totalAmount)")
    }
    
    
    
}
