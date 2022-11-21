//
//  RegistationViewController.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import UIKit

protocol ViewControllerDelegate : AnyObject {
    func updateTableNumbers(tables: [Table])
}

class RegistationViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var txtFIO: UITextField!
    @IBOutlet weak var txtGuestCount: UITextField!
    @IBOutlet weak var txtTableNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFIO.addOnlyBottomBorder()
        txtGuestCount.addOnlyBottomBorder()
        txtTableNumber.addOnlyBottomBorder()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func showTables(_ sender: UITextField) {
        performSegue(withIdentifier: "showTables", sender: sender)
    }
    
    @IBAction func showCheck(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Показать чек?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: { [weak self] _ in self?.performSegue(withIdentifier: "showCheckVC", sender: sender)}))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        self.present(alert, animated: true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableChooserVC = segue.destination as? TableChooserViewController {
            if var chosenTableString = txtTableNumber.text, chosenTableString != "" {
                chosenTableString = chosenTableString.replacingOccurrences(of: " ", with: "")
                let chosenTablesNumbers = chosenTableString.components(separatedBy: ",").map( {Int($0) ?? 0} )
                tableChooserVC.chosenTablesNumbers = chosenTablesNumbers
            }
            tableChooserVC.delegate = self
        }
    }
    
    func updateTableNumbers(tables: [Table]) {
        txtTableNumber.text = ""
        if let tableNumber = tables.first?.number, tables.count == 1 {
            txtTableNumber.text = String(tableNumber)
        } else {
            for index in tables.indices {
                if tables[index] != tables.last {
                    txtTableNumber.text! += String(tables[index].number) + ", "
                } else {
                    txtTableNumber.text! += String(tables[index].number)
                }
            }
        }
    }
}
