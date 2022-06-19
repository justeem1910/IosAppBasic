//
//  OtpViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 14/06/2022.
//

import UIKit

class OtpViewController: UIViewController {

    @IBOutlet weak var btnBackOtp: UIButton!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var stvOtp: UIStackView!
    @IBOutlet weak var tfOtp1:UITextField!
    @IBOutlet weak var tfOtp2:UITextField!
    @IBOutlet weak var tfOtp3:UITextField!
    @IBOutlet weak var tfOtp4:UITextField!
    @IBOutlet weak var tfOtp5:UITextField!
    @IBOutlet weak var tfOtp6:UITextField!

    
    
    var stringNumber = "Vui lòng nhập mã gồm 4 chữ số đã được gửi đến bạn vào số điện thoại "
    var phoneNumber = ""
    override func viewDidLayoutSubviews() {
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
        tfOtp1.delegate = self
        tfOtp2.delegate = self
        tfOtp3.delegate = self
        tfOtp4.delegate = self
        tfOtp5.delegate = self
        tfOtp6.delegate = self
        

        
    }
    func setView(){
        let numberAttribute = [ NSAttributedString.Key.font:  Constants.Font.otpString]
        
        let numberAttString = NSMutableAttributedString(string: stringNumber , attributes: numberAttribute as [NSAttributedString.Key : Any])
        
        let phoneAttribute = [ NSAttributedString.Key.font:  Constants.Font.otpPhone]
        
        let phoneAttString = NSAttributedString(string: phoneNumber, attributes: phoneAttribute as [NSAttributedString.Key : Any])
        numberAttString.append(phoneAttString)
        lblPhone.attributedText = numberAttString
        
        
        
        setTextFieldOtp(textField: tfOtp1)
        setTextFieldOtp(textField: tfOtp2)
        setTextFieldOtp(textField: tfOtp3)
        setTextFieldOtp(textField: tfOtp4)
        setTextFieldOtp(textField: tfOtp5)
        setTextFieldOtp(textField: tfOtp6)
        
        tfOtp1.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp2.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp3.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp4.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp5.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp6.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        
        
    }
    @objc func OtpTapAction (textField:UITextField){
        if textField.text?.count ?? 0 == 1 {
            switch textField{
            case tfOtp1:
                checkOtpTfEmpty()
            case tfOtp2:
                checkOtpTfEmpty()
            case tfOtp3:
                checkOtpTfEmpty()
            case tfOtp4:
                checkOtpTfEmpty()
            case tfOtp5:
                checkOtpTfEmpty()
            case tfOtp6:
               checkOtpTfEmpty()
            default:
                break
            }
        }
    }
    func checkOtpTfEmpty(){
        if tfOtp1.text?.count == 0 {
            tfOtp1.becomeFirstResponder()
        } else if tfOtp2.text?.count == 0 {
            tfOtp2.becomeFirstResponder()
        } else if tfOtp3.text?.count == 0 {
            tfOtp3.becomeFirstResponder()
        } else if tfOtp4.text?.count == 0 {
            tfOtp4.becomeFirstResponder()
        } else if tfOtp5.text?.count == 0 {
            tfOtp5.becomeFirstResponder()
        } else if tfOtp6.text?.count == 0 {
            tfOtp6.becomeFirstResponder()
        }
    }
    
    func setTextFieldOtp (textField :UITextField){
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    

    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension OtpViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count == 1 && !string.isEmpty{
            return false
        } else {
            return true
        }
    }
}
extension UITextField {
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.paste(_:)) ?
            false : super.canPerformAction(action, withSender: sender)
    }
}
