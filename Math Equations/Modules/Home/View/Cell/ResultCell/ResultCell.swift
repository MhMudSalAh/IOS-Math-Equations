//
//  ResultCell.swift
//  Math Equations
//
//  Created by MhMuD SalAh on 02/09/2021.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var lblEquation: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    func setupCell(_ equation: Equation) {
        lblEquation.text = "\(equation.firstNumber) \t\(equation.operation)\t \(equation.secondNumber)"
        lblResult.text = "\(equation.result.rounded(places: 2))"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
