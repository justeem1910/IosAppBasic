//
//  OtpViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 14/06/2022.
//

import UIKit
import IQKeyboardManagerSwift

class OtpViewController: UIViewController {

    @IBOutlet weak var btnBackOtp: UIButton!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblIncorrectOtp: UILabel!
    @IBOutlet weak var stvOtp: UIStackView!
    @IBOutlet weak var tfOtp1:CustomTextField!
    @IBOutlet weak var tfOtp2:CustomTextField!
    @IBOutlet weak var tfOtp3:CustomTextField!
    @IBOutlet weak var tfOtp4:CustomTextField!
    @IBOutlet weak var tfOtp5:CustomTextField!
    @IBOutlet weak var tfOtp6:CustomTextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnResendOtp: UIButton!
    
    
    var arrTextFieldOtp:[CustomTextField] = [CustomTextField]()
    var stringNumber = "Vui lòng nhập mã gồm 6 chữ số đã được gửi đến bạn vào số điện thoại "
    var phoneNumber = ""
    var countTime = 60
    var countTextField = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        for i in 0...5 {
            if arrTextFieldOtp[i].text?.count == 0 {
                arrTextFieldOtp[i].becomeFirstResponder()
                break
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        registerObserver()
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
    }
    
    func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObserver()
    }
    
    func removeObserver (){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func setView(){
        tfOtp1.delegate = self
        tfOtp2.delegate = self
        tfOtp3.delegate = self
        tfOtp4.delegate = self
        tfOtp5.delegate = self
        tfOtp6.delegate = self
        

        arrTextFieldOtp = [tfOtp1,tfOtp2,tfOtp3,tfOtp4,tfOtp5,tfOtp6]
        for i in 1...5 {
            arrTextFieldOtp[i].previousTextField = arrTextFieldOtp[i-1]
        }
        for textField in  arrTextFieldOtp {
            textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .allTouchEvents)
        }
        
        let numberAttribute = [ NSAttributedString.Key.font:  UIFont(name: Constants.Font.nunitoRegular, size: 14)]
        
        let numberAttString = NSMutableAttributedString(string: stringNumber , attributes: numberAttribute as [NSAttributedString.Key : Any])
        
        let phoneAttribute = [ NSAttributedString.Key.font:  UIFont(name: Constants.Font.nunitoBold, size: 14)]
        
        let phoneAttString = NSAttributedString(string: phoneNumber, attributes: phoneAttribute as [NSAttributedString.Key : Any])
        numberAttString.append(phoneAttString)
        lblPhone.attributedText = numberAttString
        
        btnContinue.layer.cornerRadius = 24
        btnResendOtp.layer.cornerRadius = 18
        btnResendOtp.layer.borderWidth = 1
        btnResendOtp.layer.borderColor = Constants.Color.gray4.cgColor
        
        setTextFieldOtp(textField: tfOtp1)
        setTextFieldOtp(textField: tfOtp2)
        setTextFieldOtp(textField: tfOtp3)
        setTextFieldOtp(textField: tfOtp4)
        setTextFieldOtp(textField: tfOtp5)
        setTextFieldOtp(textField: tfOtp6)
        
        setTFOtpAnimation(textField: tfOtp1)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    //MARK: IBAction
    
    @IBAction func pressBtnResendOtp(_ sender: Any) {
        countTime = 60
        btnResendOtp.setTitleColor(Constants.Color.gray4, for: .normal)
        btnResendOtp.layer.borderColor = Constants.Color.gray4.cgColor
    }
    @objc func updateCounter() {
        if countTime > 0 {
            countTime -= 1
            btnResendOtp.setTitle("Gửi lại mã sau \(countTime)s", for: .normal)
            btnResendOtp.isUserInteractionEnabled = false
            if countTime == 0 {
                btnResendOtp.layer.borderColor = Constants.Color.green.cgColor
                btnResendOtp.setTitleColor(Constants.Color.green, for: .normal)
                btnResendOtp.setTitle("Gửi lại mã", for: .normal)
                btnResendOtp.isUserInteractionEnabled = true
            }
        }
    }
    
    func setTextFieldOtp (textField :CustomTextField){
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
        textField.tintColor = Constants.Color.green
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.btnContinue.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height + self.view.safeAreaInsets.bottom)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.btnContinue.transform = .identity
        }
    }
    func setBtnContinueOn(){
        btnContinue.backgroundColor = Constants.Color.green
        btnContinue.isUserInteractionEnabled = true
    }
    
    @IBAction func btnContinueAction(_ sender: Any) {
        let otpString = "\(tfOtp1.text!)\(tfOtp2.text!)\(tfOtp3.text!)\(tfOtp4.text!)\(tfOtp5.text!)\(tfOtp6.text!)"
        if otpString == "111111"{
            let homeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            self.navigationController?.pushViewController(homeVC!, animated: true)
        } else {
            if lblIncorrectOtp.isHidden == true {
                btnResendOtp.transform = CGAffineTransform(translationX: 0, y: +lblIncorrectOtp.frame.height + 6)            }
            lblIncorrectOtp.isHidden = false
        }
    }

    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

//MARK: - UITextFieldDelegate

extension OtpViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (((textField.text?.count ?? 0) < 1) && (string.count > 0))  {
            if textField == tfOtp1 {
                setTFOtpAnimation(textField: tfOtp2)
            }
            if textField == tfOtp2 {
                setTFOtpAnimation(textField: tfOtp3)
            }
            if textField == tfOtp3 {
                setTFOtpAnimation(textField: tfOtp4)
            }
            if textField == tfOtp4 {
                setTFOtpAnimation(textField: tfOtp5)
            }
            if textField == tfOtp5 {
                setTFOtpAnimation(textField: tfOtp6)
            }
            textField.text = string
            for tf in arrTextFieldOtp {
                if tf.text?.count ?? 0 == 1{
                    countTextField += 1
                }
            }
            if countTextField == 6 {
                btnContinue.backgroundColor = Constants.Color.green
                btnContinue.isUserInteractionEnabled = true
            }
            if textField == tfOtp6 {
                btnContinue.backgroundColor = Constants.Color.green
                btnContinue.isUserInteractionEnabled = true
            }
            
            return false

        } else if  ((textField.text?.count ?? 0) > 0) && (string.count == 0){
            textField.text = ""
            btnContinue.backgroundColor = Constants.Color.green2
            btnContinue.isUserInteractionEnabled = false
            if lblIncorrectOtp.isHidden == false{
                lblIncorrectOtp.isHidden = true
                btnResendOtp.transform = CGAffineTransform(translationX: 0, y: -stvOtp.frame.height + 32)
            }
            return false
        } else if ((textField.text?.count ?? 0) > 0) && (string.count > 0){
            if textField == tfOtp1 {
                tfOtp1.text = string
                setTFOtpAnimation(textField: tfOtp2)
            }
            if textField == tfOtp2 {
                tfOtp2.text = string
                setTFOtpAnimation(textField: tfOtp3)
            }
            if textField == tfOtp3 {
                tfOtp3.text = string
                setTFOtpAnimation(textField: tfOtp4)
            }
            if textField == tfOtp4 {
                tfOtp4.text = string
                setTFOtpAnimation(textField: tfOtp5)
            }
            if textField == tfOtp5 {
                tfOtp5.text = string
                setTFOtpAnimation(textField: tfOtp6)
            }
            if textField == tfOtp6 {
                tfOtp6.text = string
                
                setBtnContinueOn()
            }

          
            return false
        }else if (textField.text?.count ?? 0) > 0 && textField == tfOtp6{
            textField.text = string
            setBtnContinueOn()
            return false
        }
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Constants.Color.green.cgColor
    }
    func setTFOtpAnimation(textField: CustomTextField){
        textField.becomeFirstResponder()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Constants.Color.green.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        countTextField = 0
        
    }
    
    
}
