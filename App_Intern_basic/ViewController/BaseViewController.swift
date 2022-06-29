//
//  BaseViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 28/06/2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        
    }
    
    //MARK: Loader
    
    func showActivityIndicator(toView: UIView) {
        
        self.view.endEditing(true)
        ProgressHUD.colorStatus = .black
        ProgressHUD.show("Đang tải", interaction: false)
    }
    
    func dismissActivityIndicator() {
        ProgressHUD.dismiss()
        
    }
    
    func showLoaderView( toView: UIView? = nil) {
        self.view.endEditing(true)
        ProgressHUD.colorStatus = .black
        ProgressHUD.show("Đang tải", interaction: false)
    }
    
    func dismissLoaderView() {
        ProgressHUD.dismiss()
    }

}
