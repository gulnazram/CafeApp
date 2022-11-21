//
//  Table.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import Foundation
import UIKit

struct Table : Equatable {
    
    var status : Status
    var number : Int
    
    enum Status : CaseIterable {
        case isBusy
        case isReserved
        case isFree
        case isChosen
        var parametres: (backColor: UIColor, title: String, countForRandomCreate: Int?) {
            switch self {
            case .isBusy: return (UIColor.red, "ЗАНЯТ", 4)
            case .isReserved: return (UIColor.systemPink, "РЕЗЕРВ", 2)
            case .isFree: return (UIColor.gray, "СВОБОДЕН", 0)
            case .isChosen: return (UIColor.systemGreen, "ВЫБРАН", nil)
            }
        }
    }

}


