//
//  CustomTextField.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 20/06/2022.
//

import UIKit

class CustomTextField: UITextField {
    weak var previousTextField:UITextField!
   
    weak var nextTextField:UITextField!
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            if action == #selector(UIResponderStandardEditActions.paste(_:)) {
                return false
            }
            return super.canPerformAction(action, withSender: sender)
       }
    override func deleteBackward() {
//        if text?.count == 0 {
//            previousTextField?.isUserInteractionEnabled = true
//            previousTextField?.text = ""
//
//        } else {
//
//        }
        text = ""
        previousTextField?.isUserInteractionEnabled = true
        previousTextField?.text = ""
        previousTextField?.layer.cornerRadius = 8
        previousTextField?.layer.borderColor = Constants.Color.green.cgColor
        previousTextField?.layer.borderWidth = 1
        previousTextField?.becomeFirstResponder()
    }

}
