//
//  OtpViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 09/06/2022.
//

import UIKit

class PhoneViewController: UIViewController {
    

    @IBOutlet weak var viewPhoneNumber: UIView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnHotline: UIView!
    @IBOutlet weak var lblHotline: UILabel!

    var phoneNumber = ""
    var phoneContinue1 = "123456789"
    var phoneContinue2 = "0123456789"
    var hotline = "Hotline "
    var phoneHotline = "1900 6036 893"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
        tfPhoneNumber.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
    
    }
    func setView(){
        viewPhoneNumber.layer.cornerRadius = 28
        viewPhoneNumber.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viewPhoneNumber.layer.shadowOpacity = 1
        viewPhoneNumber.layer.shadowRadius = 20
        viewPhoneNumber.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewPhoneNumber.layer.borderWidth = 1
        
        viewPhoneNumber.layer.borderColor = Constants.Color.gray.cgColor
        tfPhoneNumber.text = ""
        
        btnContinue.backgroundColor = Constants.Color.green2
        btnContinue.layer.cornerRadius = 24
        
        btnHotline.layer.cornerRadius = 24
        
        

        let hotlineAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "NunitoSans-Regular", size: 17) ]
        
        let hotlineAttString = NSMutableAttributedString(string: hotline , attributes: hotlineAttribute as [NSAttributedString.Key : Any])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.04
        
        let hotlinePhoneAttribute = [ NSAttributedString.Key.foregroundColor: Constants.Color.green, NSAttributedString.Key.font: UIFont(name: "NunitoSans-Bold", size: 17) , NSAttributedString.Key.paragraphStyle: paragraphStyle]
        
        let hotlinePhoneAttString = NSAttributedString(string: phoneHotline, attributes: hotlinePhoneAttribute as [NSAttributedString.Key : Any])
        hotlineAttString.append(hotlinePhoneAttString)
        
        lblHotline.attributedText = hotlineAttString

    }
    override func viewDidLayoutSubviews() {
        phoneNumber = tfPhoneNumber.text ?? ""
        if phoneNumber.first == "0"{
            if tfPhoneNumber.text?.count ?? 0 > 9 {
                tfPhoneNumber.resignFirstResponder()
                btnContinue.isEnabled = true
                btnContinue.backgroundColor = Constants.Color.green
            } else {
                btnContinue.backgroundColor = Constants.Color.green2
                btnContinue.isEnabled = false
            }
        } else {
            if tfPhoneNumber.text?.count ?? 0 > 8 {
                tfPhoneNumber.resignFirstResponder()
                btnContinue.backgroundColor = Constants.Color.green
                btnContinue.isEnabled = true
            } else {
                btnContinue.backgroundColor = Constants.Color.green2
                btnContinue.isEnabled = false
            }
        }
        
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        phoneNumber = tfPhoneNumber.text ?? ""
        if phoneNumber == "123456789" || phoneNumber == "0123456789"{
            let otpvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController
            self.navigationController?.pushViewController(otpvc!, animated: true)
        }
    }
    
    
    @objc func myTargetFunction(textField: UITextField) {
        viewPhoneNumber.layer.borderColor = Constants.Color.green.cgColor
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if tfPhoneNumber.text?.count == 0 {
            viewPhoneNumber.layer.borderColor = Constants.Color.gray.cgColor
        }
        
       
        tfPhoneNumber.resignFirstResponder()
    }
}
