//
//  WebKitViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 05/07/2022.
//

import UIKit
import WebKit
class DetailsViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var wkv: WKWebView!
    @IBOutlet weak var btnShare: UIButton!
    
    var stringURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewVC()
        wkv.navigationDelegate = self
    }
    func configViewVC (){
        if let stringURL = stringURL {
            let url = URL(string: stringURL)
            if let url = url {
                wkv.load(URLRequest(url: url))
            }
        }
    }
    
    
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func btnShareAction(_ sender: Any) {
        if let stringURL = stringURL {
            UIPasteboard.general.string = stringURL
        }
    }
    
}

extension DetailsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        ProgressHUD.colorStatus = .black
        ProgressHUD.show("Đang tải", interaction: false)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ProgressHUD.dismiss()
    }
}
