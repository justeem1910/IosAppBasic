//
//  DoctorVCModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 04/07/2022.
//

import Foundation
class DoctorVCModel: NSObject, JsonInitObject{
    var doctorList: [DoctorHomeModel]?
    
    convenience init(doctorList: [DoctorHomeModel]?) {
        self.init()
        self.doctorList = doctorList
    }
    
    required convenience init(json: [String : Any]) {
        self.init()
        if let wrapValue = json["items"] as? [[String:Any]]{
            let jsonValue = wrapValue.map({DoctorHomeModel(json: $0)})
            self.doctorList = jsonValue
        }
    }

}
