//
//  MyManager.swift
//  Global Relay
//
//  Created by Parth Patel on 06/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit


struct Font {
    static let normalFont = UIFont.systemFont(ofSize: 14)
    static let bolFont = UIFont.boldSystemFont(ofSize: 15)
}

class MyManager: NSObject {

    static public let sharedInstance = MyManager()
    
    func verifyUrl (urlString: String?) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: urlString)
        return result
    }
    
    func alert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        return alert
    }

}
