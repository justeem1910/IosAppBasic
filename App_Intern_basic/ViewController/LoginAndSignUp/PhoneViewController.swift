//
//  OtpViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 09/06/2022.
//

import UIKit
import IQKeyboardManagerSwift

class PhoneViewController: UIViewController {
    

    @IBOutlet weak var viewPhoneNumber: UIView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnHotline: UIView!
    @IBOutlet weak var lblHotline: UILabel!

    var phoneNumber = ""
    var hotline = "Hotline "
    var phoneHotline = "1900 6036 893"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
        
    
    }
    func setView(){
        viewPhoneNumber.layer.cornerRadius = 28
        viewPhoneNumber.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viewPhoneNumber.layer.shadowOpacity = 1
        viewPhoneNumber.layer.shadowRadius = 20
        viewPhoneNumber.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewPhoneNumber.layer.borderWidth = 1
        
        viewPhoneNumber.layer.borderColor = Constants.Color.gray5.cgColor
        tfPhoneNumber.text = ""
        tfPhoneNumber.delegate = self
        tfPhoneNumber.clearButtonMode = .whileEditing
        
        btnContinue.backgroundColor = Constants.Color.green2
        btnContinue.layer.cornerRadius = 24
        btnContinue.isUserInteractionEnabled = false
        tfPhoneNumber.addTarget(self, action: #selector(tapOnTFPhone), for: .editingChanged)
        
        

        let hotlineAttribute = [ NSAttributedString.Key.foregroundColor: Constants.Color.gray1, NSAttributedString.Key.font: UIFont(name: Constants.Font.nunitoRegular, size: 17) ]
        
        let hotlineAttString = NSMutableAttributedString(string: hotline , attributes: hotlineAttribute as [NSAttributedString.Key : Any])
        
        let hotlinePhoneAttribute = [ NSAttributedString.Key.foregroundColor: Constants.Color.green, NSAttributedString.Key.font: UIFont(name: Constants.Font.nunitoBold, size: 17) ]
        
        let hotlinePhoneAttString = NSAttributedString(string: phoneHotline, attributes: hotlinePhoneAttribute as [NSAttributedString.Key : Any])
        hotlineAttString.append(hotlinePhoneAttString)
        
        lblHotline.attributedText = hotlineAttString

    }
    
    @IBAction func btnContinue(_ sender: Any) {
        phoneNumber = tfPhoneNumber.text ?? ""
        if phoneNumber.first == "0"{
            phoneNumber.remove(at: phoneNumber.startIndex )
        }
        var nextPhone = "+84 "
        var arr = Array(phoneNumber)
        var i = 0;
        while i < arr.count {
            nextPhone += String(arr[i])
            if (i + 1) % 3 == 0 {
                nextPhone += " "
            }
            i += 1
        }
        
        let otpvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController
        otpvc?.phoneNumber = nextPhone
        self.navigationController?.pushViewController(otpvc!, animated: true)
    }
    
    
    
    @objc func tapOnTFPhone(textField: UITextField) {
        viewPhoneNumber.layer.borderColor = Constants.Color.green.cgColor
        phoneNumber = tfPhoneNumber.text ?? ""
        if phoneNumber.first == "0"{
            if tfPhoneNumber.text?.count ?? 0 > 9 {
                btnContinue.isUserInteractionEnabled = true
                btnContinue.backgroundColor = Constants.Color.green
            } else {
                btnContinue.backgroundColor = Constants.Color.green2
                btnContinue.isUserInteractionEnabled = false
            }
        } else {
            if tfPhoneNumber.text?.count ?? 0 > 8 {
                btnContinue.backgroundColor = Constants.Color.green
                btnContinue.isUserInteractionEnabled = true
            } else {
                btnContinue.backgroundColor = Constants.Color.green2
                btnContinue.isUserInteractionEnabled = false
            }
        }
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension PhoneViewController: UITextFieldDelegate{
    func textField(_ textField:UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfPhoneNumber {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewPhoneNumber.layer.borderColor = Constants.Color.green.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count == 0 {
            viewPhoneNumber.layer.borderColor = Constants.Color.gray5.cgColor
            
        }
    }
    
    
}
