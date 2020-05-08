//
//  ThirdTabViewController.swift
//  Global Relay
//
//  Created by Parth Patel on 06/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit
import WebKit

class ThirdTabViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet var inputTexField: UITextField!
    @IBOutlet var showButton: UIButton!
    @IBOutlet var webView: WKWebView!
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Load Web view
    func loadWebView(urlString: String) {
        let url: URL?
        if urlString.hasPrefix("https://") {
            url = URL(string: urlString)
        } else {
            url = URL(string: "http://" + urlString)
        }
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    
    // MARK: - UIAction Methods
    
    @IBAction func buttonActions(_ sender: Any) {
        guard NetMonitor.shared.netOn else {
            let alert = MyManager.sharedInstance.alert(message: "Check your internet connection")
            present(alert, animated: true)
            return
        }
        
        inputTexField.resignFirstResponder()
        
        guard MyManager.sharedInstance.verifyUrl(urlString: inputTexField.text!) else {
            let alert = MyManager.sharedInstance.alert(message: "Entered URL is not a valid URL")
            present(alert, animated: true)
            return
        }
        
        self.loadWebView(urlString: inputTexField.text!)
    }
}

extension ThirdTabViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

