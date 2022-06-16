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
        let numberAttribute = [ NSAttributedString.Key.font: UIFont(name: "NunitoSans-Regular", size: 14) ]
        
        let numberAttString = NSMutableAttributedString(string: stringNumber , attributes: numberAttribute as [NSAttributedString.Key : Any])
        
        let phoneAttribute = [ NSAttributedString.Key.font: UIFont(name: "NunitoSans-Bold", size: 14) ]
        
        let phoneAttString = NSAttributedString(string: phoneNumber, attributes: phoneAttribute as [NSAttributedString.Key : Any])
        numberAttString.append(phoneAttString)
        lblPhone.attributedText = numberAttString
    }
    
    

    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension OtpViewController: UITextFieldDelegate{
    
}
