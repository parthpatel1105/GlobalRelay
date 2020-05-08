//
//  Country.swift
//  Global Relay
//
//  Created by Parth Patel on 07/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation
import UIKit



class Country
{
    var title: String
    var description: String
    var image: UIImage
    
    init(titled: String, description: String, imageName: String)
    {
        self.title = titled
        self.description = description
        if let img = UIImage(named: imageName) {
            image = img
        } else {
            image = UIImage(named: "canada")!
        }
    }
}
