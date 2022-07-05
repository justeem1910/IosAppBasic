//
//  PromotionVcModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 29/06/2022.
//

import Foundation
class PromotionVcModel: NSObject, JsonInitObject{
    var promotionList: [PromotionHomeModel]?
    
    convenience init(promotionList: [PromotionHomeModel]?) {
        self.init()
        self.promotionList = promotionList
    }
    
    required convenience init(json: [String : Any]) {
        self.init()
        if let wrapValue = json["items"] as? [[String:Any]]{
            let jsonValue = wrapValue.map({PromotionHomeModel(json: $0)})
            self.promotionList = jsonValue
        }
    }

}

