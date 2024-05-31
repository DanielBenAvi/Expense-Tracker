//
//  ViewController.swift
//  Expense Tracker
//
//  Created by דניאל בן אבי on 31/05/2024.
//

import UIKit

class ViewController: UIViewController, AddViewControllerDelegate {
    func didSaveExpense(expense: Expence) {
        totalAmount += expense.amount
    }
    
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    var expencesManager = ExpencesManager.shared
    
    var totalAmount: Double = 0.0 {
            didSet {
                totalAmountLabel.text = String(format: "%.2f", totalAmount)
            }
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setNewTotalAmount()
    }
    
    func setNewTotalAmount() {
        totalAmountLabel.text = "Total Amount: \(expencesManager.totalAmount)"
    }
    
    @IBAction func addExpenseButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addViewController = storyboard.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else {
            return
        }
        present(addViewController, animated: true, completion: nil)
    }

}

