//
//  CurrencyTableViewCell.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    static let ID = "CurrencyTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: CurrencyModel){
        titleLabel.text = model.title
    }
    
}
