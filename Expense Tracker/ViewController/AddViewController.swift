//
//  AddViewController.swift
//  Expense Tracker
//
//  Created by דניאל בן אבי on 31/05/2024.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func didSaveExpense(expense: Expence)
}


class AddViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var saveExpenceButton: UIButton!
    
    var expencesManager = ExpencesManager.shared
    weak var delegate: AddViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // set pickerView delegate and dataSource
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @IBAction func saveExpenceButtonTapped(_ sender: UIButton) {
        // Get the name from the nameTextField
        guard let name = nameTextField.text, !name.isEmpty else {
            print("Name is empty")
            return
        }
        // Get the amount from the amountTextField
        guard let amountString = amountTextField.text, !amountString.isEmpty else {
            print("Amount is empty")
            return
        }
        // Convert the amount to a Double
        guard let amount = Double(amountString) else {
            print("Invalid amount")
            return
        }
        // Get the date from the datePicker
        let date = datePicker.date
        // Get the category from the pickerView
        let category = Category.allCases[pickerView.selectedRow(inComponent: 0)]
        
        // Create a new Expence object
        let expence = Expence(title: name, amount: amount, date: date, category: category)
        
        expence.printExpence()
        
        // Add the expence to the expencesManager
        expencesManager.addExpence(expence: expence)
        
        
        // Notify the delegate
        delegate?.didSaveExpense(expense: expence)
        
        // Dismiss the AddViewController
        dismiss(animated: true) {
            print("AddViewController dismissed")
        }
    }
    

}

extension AddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category.allCases[row].rawValue
    }
    
}
