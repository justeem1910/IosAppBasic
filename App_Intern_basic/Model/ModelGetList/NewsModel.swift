//
//  NewsModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 12/07/2022.
//

import Foundation
class NewsModel: NSObject, JsonInitObject {
    var category_id     : Int?
    var category_name     : String?
    var created_at     : String?
    var id     : Int?
    var link     : String?
    var picture     : String?
    var picture_caption     : String?
    var slug     : String?
    var title     : String?
    
    convenience init(category_id: Int?,
                     category_name: String?,
                     created_at: String?,
                     id: Int?,
                     link: String?,
                     picture: String?,
                     picture_caption: String?,
                     slug: String?,
                     title: String?) {
        self.init()
        
        self.category_id = category_id
        self.category_name = category_name
        self.created_at = created_at
        self.id = id
        self.link = link
        self.picture = picture
        self.picture_caption = picture_caption
        self.slug = slug
        self.title = title
    }
    
    
    required convenience init(json: [String: Any]) {
        self.init()
        
        if let wrapValue = json["category_id"] as? Int {
            self.category_id = wrapValue
        }
        if let wrapValue = json["category_name"] as? String {
            self.category_name = wrapValue
        }
        if let wrapValue = json["created_at"] as? String {
            self.created_at = wrapValue
        }
        if let wrapValue = json["id"] as? Int {
            self.id = wrapValue
        }
        if let wrapValue = json["link"] as? String {
            self.link = wrapValue
        }
        if let wrapValue = json["picture"] as? String {
            self.picture = wrapValue
        }
        if let wrapValue = json["picture_caption"] as? String {
            self.picture_caption = wrapValue
        }
        if let wrapValue = json["slug"] as? String {
            self.slug = wrapValue
        }
        if let wrapValue = json["title"] as? String {
            self.title = wrapValue
        }
    }
}
