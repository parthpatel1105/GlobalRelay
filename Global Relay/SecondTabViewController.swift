//
//  SecondTabViewController.swift
//  Global Relay
//
//  Created by Parth Patel on 06/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class SecondTabViewController: UIViewController {
    
    
    @IBOutlet var inputTextView: UITextView!
    @IBOutlet var editButton: UIButton!
    
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "inputText") != nil {
            inputTextView.text = (UserDefaults.standard.value(forKey: "inputText") as! String)
        }
        
        inputTextView.isSelectable = true
        inputTextView.layer.borderWidth = 1.0
        inputTextView.layer.borderColor = UIColor.black.cgColor
        inputTextView.font = .preferredFont(forTextStyle: .body)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //(Optional) The saved text should support dynamic font where font size adjusts to the device setting
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: nil, queue: .main) { [weak self] notification in
            self?.inputTextView.font = .preferredFont(forTextStyle: .body)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIContentSizeCategory.didChangeNotification, object: nil)
        
    }
    
    
    // MARK: - Handle Notifications
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                let diff = self.editButton.frame.maxY - keyboardSize.origin.y
                if diff > 0 {
                    self.view.frame.origin.y -= diff + 10
                }
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            
        }
    }
    
    // MARK: - Tap Gesture
    @objc func handleKeyboard(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self.inputTextView)
        
        if !self.inputTextView.bounds.contains(location) {
            savedata()
        }
    }
    
    
    // MARK: - Action Methods
    @IBAction func buttonAction(_ sender: UIButton) {
        if sender.tag == 1 {
            inputTextView.isEditable = true
            inputTextView.becomeFirstResponder()
            
        } else if sender.tag == 2 {
            savedata()
        }
    }
    
    func savedata() {
        inputTextView.isEditable = false
        inputTextView.resignFirstResponder()
        
        UserDefaults.standard.set(inputTextView.text, forKey: "inputText")
        UserDefaults.standard.synchronize()
    }
    
}

extension SecondTabViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
}
