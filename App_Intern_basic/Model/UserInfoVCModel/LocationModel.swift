//
//  LocationModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 08/07/2022.
//

import Foundation
class LocationModel: NSObject, JsonInitObject {
    var provinceName ,districtName , wardName: String?
    
    convenience init(provinceName: String?, districtName: String?, wardName: String?) {
        self.init()
        self.provinceName = provinceName
        self.districtName = districtName
        self.wardName = wardName
        
    }
    required convenience init (json: [String: Any]){
        self.init()
        if let wrapValue = json["province_name"] as?  String {
            self.provinceName = wrapValue
        }
        if let wrapValue = json["district_name"] as? String {
            self.districtName = wrapValue
        }
        if let wrapValue = json["ward_name"] as? String {
            self.wardName = wrapValue
        }
    }
}
