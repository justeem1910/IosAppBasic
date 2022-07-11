//
//  UserInfoViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 05/07/2022.
//

import UIKit
import IQKeyboardManagerSwift

class UserInfoViewController: BaseViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    
    @IBOutlet weak var scvUser: UIScrollView!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfProvincename: UITextField!
    
    @IBOutlet weak var tfDate: UITextField!
    @IBOutlet weak var sgmGender: UISegmentedControl!
    @IBOutlet weak var tfDistrictName: UITextField!
    @IBOutlet weak var tfWardName: UITextField!
    
    @IBOutlet weak var lblMale: UILabel!
    @IBOutlet weak var imgFemale: UIImageView!
    @IBOutlet weak var lblFemale: UILabel!
    @IBOutlet weak var imgMale: UIImageView!
    @IBOutlet weak var tfBlood: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    
    var userModel: UserModel?
    var locationModel:LocationModel?
    let datePicker = UIDatePicker()
    let dateFomatter = DateFormatter()
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
    }
    
    func setView(){
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
        btnOK.layer.cornerRadius = 24
        scvUser.refreshControl = refreshControl
        tfFirstName.delegate = self
        tfLastName.delegate = self
        tfDate.delegate = self
        tfEmail.delegate = self
        tfPhone.delegate = self
        tfAddress.delegate = self
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        loadNewFeed()
        createDatePicker()
    }
    
    func createDatePicker(){
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }

        tfDate.inputView = datePicker
    }
    
    @objc func loadNewFeed() {
        self.showLoaderView()
        
        APIUtilities.requestUserInfoVC { [weak self] userinfo, error in
            
            guard let self = self else { return}
            guard let userinfo = userinfo, error == nil else {
                return
            }
            self.userModel = userinfo
            self.refreshControl.endRefreshing()
            
            DispatchQueue.main.async{ [weak self] in
                guard let self = self else { return}
            }
            self.loadLocationUser()
        }
    }
    func loadLocationUser() {
        APIUtilities.requestUserLocation (provineCode: self.userModel?.provinceCode ?? "", districtCode: self.userModel?.districtCode ?? "", wardCode: self.userModel?.wardCode ?? "") { [weak self] userLocation, error in
            guard let self = self else { return}
            self.dismissLoaderView()
            guard let userLocation = userLocation, error == nil else {
                return
            }
            self.locationModel = userLocation
            self.refreshControl.endRefreshing()
            self.setTextFieldUser()
            
            DispatchQueue.main.async{ [weak self] in
                guard let self = self else { return}
            }
        }
    }
    func setTextFieldUser (){
        tfFirstName.text = userModel?.name
        tfLastName.text = userModel?.lastName
        tfDate.text = userModel?.birthDate
        tfPhone.text = userModel?.phone
        tfEmail.text = userModel?.contactEmail
        tfAddress.text = userModel?.address
        tfBlood.text = userModel?.bloodName
        
        tfProvincename.text = locationModel?.provinceName
        tfDistrictName.text = locationModel?.districtName
        tfWardName.text = locationModel?.wardName
        
        if userModel?.sex == 1 {
            sgmGender.selectedSegmentIndex = 1
            lblMale.textColor = Constants.Color.gray2
            imgMale.tintColor = Constants.Color.gray2
            
            lblFemale.textColor = Constants.Color.green
            imgFemale.tintColor = Constants.Color.green
        } else {
            lblMale.textColor = Constants.Color.green
            imgMale.tintColor = Constants.Color.green
            
            lblFemale.textColor = Constants.Color.gray2
            imgFemale.tintColor = Constants.Color.gray2
        }
        
        btnOK.backgroundColor = Constants.Color.green
    }

    @IBAction func tapOnBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapOnBtnOK(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chooseSegmentGender(_ sender: Any) {
        if sgmGender.selectedSegmentIndex == 0 {
            lblMale.textColor = Constants.Color.green
            imgMale.tintColor = Constants.Color.green
            
            lblFemale.textColor = Constants.Color.gray2
            imgFemale.tintColor = Constants.Color.gray2
        } else {
            lblMale.textColor = Constants.Color.gray2
            imgMale.tintColor = Constants.Color.gray2
            
            lblFemale.textColor = Constants.Color.green
            imgFemale.tintColor = Constants.Color.green
        }
    }
}
extension UserInfoViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField.superview?.viewWithTag(1) as? UILabel)?.textColor = Constants.Color.green
        textField.superview?.viewWithTag(3)?.backgroundColor = Constants.Color.green
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        (textField.superview?.viewWithTag(1) as? UILabel)?.textColor = Constants.Color.gray3
        textField.superview?.viewWithTag(3)?.backgroundColor = Constants.Color.lineColor
        
        
        if textField == tfDate {
            dateFomatter.dateFormat = "dd/MM/yyyy"
            tfDate.text = dateFomatter.string(from: datePicker.date)
        }
        
    }
}
