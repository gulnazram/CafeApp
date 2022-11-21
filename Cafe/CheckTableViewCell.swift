//
//  CheckTableViewCell.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import UIKit

class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPositionName: UILabel!
    @IBOutlet weak var lblIngridients: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func refresh(_ position: Position) {
        lblPositionName.text = position.name
        lblIngridients.text = position.ingridients
        lblPrice.text = String(position.price)
    }

}
