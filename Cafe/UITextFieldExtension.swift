//
//  UITextFieldExtension.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import UIKit

extension UITextField {
    
    func addOnlyBottomBorder() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
    
}
