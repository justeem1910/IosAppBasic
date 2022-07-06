//
//  UserInfoViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 05/07/2022.
//

import UIKit

class UserInfoViewController: BaseViewController {
    
    var userList     : [UserModel]?
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNewFeed()
    }
    @objc func loadNewFeed() {
        self.showLoaderView()
        
        APIUtilities.requestUserInfoVC { [weak self] promotionFeed, error in
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            guard let self = self else { return}
            self.dismissLoaderView()
            
            
            guard let promotionFeed = promotionFeed, error == nil else {
                return
            }
            self.userList = promotionFeed.userList
            dispatchGroup.leave()
            self.refreshControl.endRefreshing()
            
//            DispatchQueue.main.sync { [weak self] in
//                guard let self = self else { return}
//
//
//            }
        }
    }

}
