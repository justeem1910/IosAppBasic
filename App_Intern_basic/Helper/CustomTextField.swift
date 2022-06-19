//
//  CustomTextField.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 20/06/2022.
//

import UIKit

class CustomTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            if action == #selector(UIResponderStandardEditActions.paste(_:)) {
                return false
            }
            return super.canPerformAction(action, withSender: sender)
       }

}
