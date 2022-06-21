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

    var arrTextFieldOtp:[UITextField] = [UITextField]()
    var local: Int = 0
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
        
        arrTextFieldOtp = [tfOtp1,tfOtp2,tfOtp3,tfOtp4,tfOtp5,tfOtp6]

        
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
        
//        tfOtp2.isUserInteractionEnabled = false
//        tfOtp3.isUserInteractionEnabled = false
//        tfOtp4.isUserInteractionEnabled = false
//        tfOtp5.isUserInteractionEnabled = false
//        tfOtp6.isUserInteractionEnabled = false
        
        tfOtp1.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp2.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp3.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp4.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp5.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        tfOtp6.addTarget(self, action: #selector(self.OtpTapAction), for: .editingChanged)
        
    }
    
    
    func setTextFieldOtp (textField :UITextField){
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
        textField.tintColor = Constants.Color.green
        if textField != tfOtp1 {
            textField.isUserInteractionEnabled = false
        } else {
            textField.becomeFirstResponder()
        }
    }
    
    
    @objc func OtpTapAction (textField:UITextField){
        if textField.text?.count ?? 0 == 1 {
            switch textField{
            case tfOtp1:
                local = 0
                addTextField(location: local)
            case tfOtp2:
                local = 1
                addTextField(location: local)

            case tfOtp3:
                local = 2
                addTextField(location: local)
            case tfOtp4:
                local = 3
                addTextField(location: local)
            case tfOtp5:
                local = 4
                addTextField(location: local)
                
            case tfOtp6:
                local = 5
                addTextField(location: local)
            default:
                break
            }
        }
        if textField.text?.count == 0 {
            switch textField {case tfOtp1:
                local = 0
                deleteTextField(location: local)
            case tfOtp2:
                local = 1
                deleteTextField(location: local)
            case tfOtp3:
                local = 2
                deleteTextField(location: local)
            case tfOtp4:
                local = 3
                deleteTextField(location: local)
            case tfOtp5:
                local = 4
                deleteTextField(location: local)
            case tfOtp6:
                local = 5
                deleteTextField(location: local)
            default:
                break
            }
        }
        
    }
    
    func addTextField (location: Int){
        if location < 5 {
            arrTextFieldOtp[location + 1].isUserInteractionEnabled = true
            arrTextFieldOtp[location + 1].layer.borderWidth = 1
            arrTextFieldOtp[location + 1].layer.borderColor = Constants.Color.green.cgColor
            arrTextFieldOtp[location + 1].becomeFirstResponder()
        }
    }
    
    func deleteTextField(location: Int){
        if location > 0 {
            arrTextFieldOtp[location - 1].isUserInteractionEnabled = true
            arrTextFieldOtp[location - 1].layer.borderWidth = 1
            arrTextFieldOtp[location - 1].layer.borderColor = Constants.Color.green.cgColor
            arrTextFieldOtp[location - 1].becomeFirstResponder()
        }
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
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isUserInteractionEnabled = false
        textField.layer.borderWidth = 0
    }
}
extension UITextField {
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.paste(_:)) ?
            false : super.canPerformAction(action, withSender: sender)
    }
    
}
