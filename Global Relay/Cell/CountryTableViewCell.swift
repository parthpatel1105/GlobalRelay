//
//  CountryTableViewCell.swift
//  Global Relay
//
//  Created by Parth Patel on 07/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryDescriptionLabel: UILabel!
    @IBOutlet weak var countryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWith(_ country: Country)
    {
        countryImageView.image = country.image        
        countryTitleLabel.attributedText = NSMutableAttributedString().bold(country.title).normal("\n\(country.description)")
            
    }

}

extension NSMutableAttributedString {

    func bold(_ value:String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : Font.bolFont, .paragraphStyle : paragraphStyle,
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func normal(_ value:String) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2

        let attributes:[NSAttributedString.Key : Any] = [
            .font : Font.normalFont, .paragraphStyle : paragraphStyle,
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        
        return self
    }
}
