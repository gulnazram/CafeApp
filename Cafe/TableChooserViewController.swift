//
//  TableChooserViewController.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import UIKit

class TableChooserViewController: UIViewController {

    @IBOutlet var tablesButtons: [UIButton]!
    
    var chosenTablesNumbers = [Int]()
    
    weak var delegate: ViewControllerDelegate?
    
    lazy var cafe = Cafe(tablesCount: tablesButtons.count, chosenTableNumbers: chosenTablesNumbers)
    
    func updateViewTables() {
        for table in cafe.tables {
            let tableButton = tablesButtons[table.number - 1]
            tableButton.backgroundColor = table.status.parametres.backColor
            tableButton.setTitle(table.status.parametres.title, for: .normal)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        var chosenTables = self.cafe.tables.filter {$0.status == .isChosen}
        chosenTables.sort {$0.number < $1.number}
        delegate?.updateTableNumbers(tables: chosenTables)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChosenTables()
        updateViewTables()
    }
    
    @IBAction func tapOnTable(_ sender: UIButton) {
        if let tableNumber = tablesButtons.firstIndex(of: sender) {
            cafe.chooseTable(tableNumber + 1)
        }
        updateViewTables()
    }
    
    func setChosenTables() {
        for tableIndex in cafe.tables.indices {
            if chosenTablesNumbers.contains(where: {$0 == cafe.tables[tableIndex].number}) {
                cafe.tables[tableIndex].status = .isChosen
            }
        }
    }
    
}
