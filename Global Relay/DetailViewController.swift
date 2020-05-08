//
//  DetailViewController.swift
//  Global Relay
//
//  Created by Parth Patel on 06/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: [String:Any]!
    var country: Country?
    @IBOutlet var infoText: UITextField!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var infoLabel: UILabel!
    var completionHandler:((String) -> Int)?
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = country?.title
        self.infoLabel.text = country?.description
        self.infoLabel.font = Font.normalFont
        self.imgView.image = country?.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,selector: #selector(timerUpdate(notification:)), name: NSNotification.Name(rawValue: "timerUpdate"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "timerUpdate"), object: nil)
    }
    
    @objc func timerUpdate(notification:Notification) {
        if let country = notification.userInfo?["data"] as? Country {
            self.title = country.title
            self.infoLabel.text = country.description
            self.imgView.image = country.image
        }
    }
    
    
}
