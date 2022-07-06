//
//  UserModel.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 06/07/2022.
//

import Foundation
class UserModel {
    var id: Int?
        var name, lastName, username, contactEmail: String?
        var phone, cardID, address, provinceCode: String?
        var districtCode, wardCode: String?
        var latitude, longitude: Int?
        var birthDate: String?
        var avatar: String?
        var degree, trainingPlace, academicRank: String?
        var majorsID: Int?
        var hospitalName: String?
        var sex, blood: Int?
        var descriptionSelf, verifiedAt: String?
        var currentStep, userType: Int?
        var referCode: String?
        var workingHourType, balance: Int?
        var ratioStar: Double?
        var numberOfReviews, numberOfStars, status, isFirstLogin: Int?
        var createdAt, updatedAt, fullAddress, fullName: String?
        var orderCancelTotal, referralTotal: Int?
        var bloodName: String?
        var totalAppointment: Int?

        convenience init(id: Int?, name: String?, lastName: String?, username: String?, contactEmail: String?, phone: String?, cardID: String?, address: String?, provinceCode: String?, districtCode: String?, wardCode: String?, latitude: Int?, longitude: Int?, birthDate: String?, avatar: String?, degree: String?, trainingPlace: String?, academicRank: String?, majorsID: Int?, hospitalName: String?, sex: Int?, blood: Int?, descriptionSelf: String?, verifiedAt: String?, currentStep: Int?, userType: Int?, referCode: String?, workingHourType: Int?, balance: Int?, ratioStar: Double?, numberOfReviews: Int?, numberOfStars: Int?, status: Int?, isFirstLogin: Int?, createdAt: String?, updatedAt: String?, fullAddress: String?, fullName: String?, orderCancelTotal: Int?, referralTotal: Int?, bloodName: String?, totalAppointment: Int?) {
            self.init()
            self.id = id
            self.name = name
            self.lastName = lastName
            self.username = username
            self.contactEmail = contactEmail
            self.phone = phone
            self.cardID = cardID
            self.address = address
            self.provinceCode = provinceCode
            self.districtCode = districtCode
            self.wardCode = wardCode
            self.latitude = latitude
            self.longitude = longitude
            self.birthDate = birthDate
            self.avatar = avatar
            self.degree = degree
            self.trainingPlace = trainingPlace
            self.academicRank = academicRank
            self.majorsID = majorsID
            self.hospitalName = hospitalName
            self.sex = sex
            self.blood = blood
            self.descriptionSelf = descriptionSelf
            self.verifiedAt = verifiedAt
            self.currentStep = currentStep
            self.userType = userType
            self.referCode = referCode
            self.workingHourType = workingHourType
            self.balance = balance
            self.ratioStar = ratioStar
            self.numberOfReviews = numberOfReviews
            self.numberOfStars = numberOfStars
            self.status = status
            self.isFirstLogin = isFirstLogin
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.fullAddress = fullAddress
            self.fullName = fullName
            self.orderCancelTotal = orderCancelTotal
            self.referralTotal = referralTotal
            self.bloodName = bloodName
            self.totalAppointment = totalAppointment
        }
    
    convenience init (json: [String: Any]){
        self.init()
        if let wrapValue = json["id"] as? Int {
            self.id = wrapValue
        }
        if let wrapValue = json["name"] as? String {
            self.name = wrapValue
        }
        if let wrapValue = json["last_name"] as? String {
            self.lastName = wrapValue
        }
        if let wrapValue = json["username"] as? String {
            self.username = wrapValue
        }
        if let wrapValue = json["contact_email"] as? String {
            self.contactEmail = wrapValue
        }
        if let wrapValue = json["phone"] as? String {
            self.phone = wrapValue
        }
        if let wrapValue = json["card_id"] as? String {
            self.cardID = wrapValue
        }
        if let wrapValue = json["address"] as? String {
            self.address = wrapValue
        }
        if let wrapValue = json["province_code"] as?    String {
            self.provinceCode = wrapValue
        }
        if let wrapValue = json["district_code"] as? String {
            self.districtCode = wrapValue
        }
        if let wrapValue = json["ward_code"] as? String {
            self.wardCode = wrapValue
        }
        if let wrapValue = json["latitude"] as? Int {
            self.latitude = wrapValue
        }
        if let wrapValue = json["longitude"] as? Int {
            self.longitude = wrapValue
        }
        if let wrapValue = json["birth_date"] as? String {
            self.birthDate = wrapValue
        }
        if let wrapValue = json["avatar"] as? String {
            self.avatar = wrapValue
        }
        if let wrapValue = json["degree"] as? String {
            self.degree = wrapValue
        }
        if let wrapValue = json["training_place"] as? String {
            self.trainingPlace = wrapValue
        }
        if let wrapValue = json["academic_rank"] as? String {
            self.academicRank = wrapValue
        }
        if let wrapValue = json["majors_id"] as? Int {
            self.majorsID = wrapValue
        }
        if let wrapValue = json["hospital_name"] as? String {
            self.hospitalName = wrapValue
        }
        if let wrapValue = json["sex"] as? Int {
            self.sex = wrapValue
        }
        if let wrapValue = json["blood"] as? Int {
            self.blood = wrapValue
        }
        if let wrapValue = json["description_self"] as? String {
            self.descriptionSelf = wrapValue
        }
        if let wrapValue = json["verified_at"] as? String {
            self.verifiedAt = wrapValue
        }
        if let wrapValue = json["current_step"] as? Int {
            self.currentStep = wrapValue
        }
        if let wrapValue = json["user_type"] as? Int {
            self.userType = wrapValue
        }
        if let wrapValue = json["refer_code"] as? String {
            self.referCode = wrapValue
        }
        if let wrapValue = json["working_hour_type"] as? Int {
            self.workingHourType = wrapValue
        }
        if let wrapValue = json["balance"] as? Int {
            self.balance = wrapValue
        }
        if let wrapValue = json["ratio_star"] as? Double {
            self.ratioStar = wrapValue
        }
        if let wrapValue = json["number_of_reviews"] as? Int {
            self.numberOfReviews = wrapValue
        }
        if let wrapValue = json["number_of_stars"] as? Int {
            self.numberOfStars = wrapValue
        }
        if let wrapValue = json["status"] as? Int {
            self.status = wrapValue
        }
        if let wrapValue = json["is_first_login"] as? Int {
            self.isFirstLogin = wrapValue
        }
        if let wrapValue = json["created_at"] as? String {
            self.createdAt = wrapValue
        }
        if let wrapValue = json["update_at"] as? String {
            self.updatedAt = wrapValue
        }
        if let wrapValue = json["full_address"] as? String {
            self.fullAddress = wrapValue
        }
        if let wrapValue = json["full_name"] as? String {
            self.fullName = wrapValue
        }
        if let wrapValue = json["order_cancel_total"] as? Int {
            self.orderCancelTotal = wrapValue
        }
        if let wrapValue = json["referral_total"] as? Int {
            self.referralTotal = wrapValue
        }
        if let wrapValue = json["blood_name"] as? String {
            self.bloodName = wrapValue
        }
        if let wrapValue = json["total_appointment"] as? Int {
            self.totalAppointment = wrapValue
        }
    }

}
