//
//  CheckTableViewController.swift
//  Cafe
//
//  Created by Gulnaz on 21.11.2022.
//

import UIKit

class CheckTableViewController: UITableViewController {
    
    //@IBOutlet weak var lblVisiterName: UILabel!
    @IBOutlet weak var lblSum: UILabel!
    var menu = [Position]()
    var chosenTables : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sum = 0
        for i in 1...2 {
            let newPosition = Position.init(positionNumber: i)
            menu.append(newPosition)
            sum += newPosition.price
        }
        lblSum.text = "Итого: \(String(sum)) руб."
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CheckTableViewCell {
            let position = menu[indexPath.row]
            cell.refresh(position)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
