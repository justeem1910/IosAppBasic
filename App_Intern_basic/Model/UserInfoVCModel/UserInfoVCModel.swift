//
//  UserInfoVCModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 06/07/2022.
//

import Foundation
class UserInfoVCModel: NSObject, JsonInitObject{
    var userList: [UserModel]?
    
    convenience init(userList: [UserModel]?) {
        self.init()
        self.userList = userList
    }
    
    required convenience init(json: [String : Any]) {
        self.init()
        if let wrapValue = json["data"] as? [[String:Any]]{
            let jsonValue = wrapValue.map({UserModel(json: $0)})
            self.userList = jsonValue
        }
    }

}
