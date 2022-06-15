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
    var stringNumber = "Vui lòng nhập mã gồm 4 chữ số đã được gửi đến bạn vào số điện thoại "
    var phoneNumber = "33333"
    override func viewDidLoad() {
        super.viewDidLoad()
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
