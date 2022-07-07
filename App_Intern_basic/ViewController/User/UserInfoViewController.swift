//
//  UserInfoViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 05/07/2022.
//

import UIKit

class UserInfoViewController: BaseViewController {
    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfDate: UITextField!
    @IBOutlet weak var imgTest: UIImageView!
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfFirstName.delegate = self
        tfDate.delegate = self
        imgTest.tintColor = Constants.Color.gray1
    }
    @objc func loadNewFeed() {
        self.showLoaderView()
        
        APIUtilities.requestUserInfoVC { [weak self] userinfo, error in
            guard let self = self else { return}
            self.dismissLoaderView()
            
            
            guard let userinfo = userinfo, error == nil else {
                return
            }
            
            self.refreshControl.endRefreshing()
            
            DispatchQueue.main.async{ [weak self] in
                guard let self = self else { return}
            }
        }
    }

}

extension UserInfoViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
}
