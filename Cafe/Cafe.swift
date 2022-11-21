//
//  Cafe.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import Foundation

class Cafe {
    
    var tables = [Table]()
    var menu = [Position]()
    
    func chooseTable(_ tableNumber: Int) {
        if let tableIndex = tables.firstIndex(where: { ()
            return $0.number == tableNumber
        }) {
            if tables[tableIndex].status == .isChosen {
                tables[tableIndex].status = .isFree
            } else if tables[tableIndex].status == .isFree {
                tables[tableIndex].status = .isChosen
            } else if tables[tableIndex].status == .isReserved {
                //TODO: show alert for change reserved to free
            }
        }
    }
    
    func fillWithRandomStatusTables(_ tablesCount: Int, _ chosenTableNumbers: [Int]) {
        for tableNumber in chosenTableNumbers {
            if tablesCount >= tableNumber {
                tables.append(Table.init(status: .isChosen, number: tableNumber))
            }
        }
        for status in Table.Status.allCases {
            var reservedTables = [Table]()
            if var countForRandomCreate = status.parametres.countForRandomCreate  {
                if countForRandomCreate == 0 {
                    countForRandomCreate = tablesCount - tables.count
                }
                while reservedTables.count < countForRandomCreate {
                    let randomIndex = Int.random(in: 0...tablesCount - 1)
                    if !tables.contains(where: {$0.number == (randomIndex + 1)}), !reservedTables.contains(where: {$0.number == (randomIndex + 1)}) {
                        reservedTables.append(Table.init(status: status, number: randomIndex + 1))
                    }
                }
                tables += reservedTables
            }
        }
       
    }
    
    init(tablesCount: Int, chosenTableNumbers: [Int]) {
        fillWithRandomStatusTables(tablesCount, chosenTableNumbers)
    }
    
}



