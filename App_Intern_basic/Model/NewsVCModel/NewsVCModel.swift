//
//  NewsVCModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 04/07/2022.
//

import Foundation
class NewsVCModel: NSObject, JsonInitObject{
    var newsList: [ArticleHomeModel]?
    
    convenience init(newsList: [ArticleHomeModel]?) {
        self.init()
        self.newsList = newsList
    }
    
    required convenience init(json: [String : Any]) {
        self.init()
        if let wrapValue = json["items"] as? [[String:Any]]{
            let jsonValue = wrapValue.map({ArticleHomeModel(json: $0)})
            self.newsList = jsonValue
        }
    }

}
