//
//  Constants.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 06/06/2022.
//

import Foundation
import UIKit

struct Constants {
    struct Color{
        static let purple1 = UIColor.init(red: 36/255 , green: 42/255 , blue: 97/255, alpha: 1.0)
        static let gradientIntroStart = UIColor.init(red: 166/255 , green: 241/255 , blue: 247/255, alpha: 1.0)
        static let gradientIntroEnd = UIColor.init(red: 243/255 , green: 245/255 , blue: 251/255, alpha: 1.0)
        static let green = UIColor.init(red: 44/255, green: 134/255, blue: 103/255, alpha: 1.0)
        static let green2 = UIColor.init(red: 44/255, green: 134/255, blue: 103/255, alpha: 0.3)
        static let gray5 = UIColor.init(red: 238/255, green: 239/255, blue: 244/255, alpha: 1.0)
        static let gray2 = UIColor.init(red: 71/255, green: 74/255, blue: 87/255, alpha: 1)
        static let gray1 = UIColor.init(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        static let gray3 = UIColor.init(red: 150/255, green: 155/255, blue: 171/255, alpha: 1)
        static let gray4 = UIColor.init(red: 217/255, green: 219/255, blue: 225/255, alpha: 1)
        static let Monochrome = UIColor.init(red: 54/255, green: 61/255, blue: 78/255, alpha: 1)
        static let shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1)
        static let lineColor = UIColor.init(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        
    }
    
    struct Font {
        static let hotline = UIFont(name: "NunitoSans-Regular", size: 17)
        static let hotlinePhone = UIFont(name: "NunitoSans-Bold", size: 17)
        static let otpString = UIFont(name: "NunitoSans-Regular", size: 14)
        static let otpPhone = UIFont(name: "NunitoSans-Bold", size: 14)
        
        static let nunitoSansRegular11 = UIFont(name: "NunitoSans-Regular", size: 11)
        static let nunitoSansRegular12 = UIFont(name: "NunitoSans-Regular", size: 12)
    }
    struct NewsVC{
        
        static let clvNewsCellHeight:CGFloat = 90
        static let clvNewsCellHeight1:CGFloat = 96
        static let clvNewstionSpace:CGFloat = 12
    }
    struct PromotionVC{
        static let clvPromotionCellHeight:CGFloat = 90
        static let clvPromotionSpace:CGFloat = 12
    }
    struct HomeVC {
        static let tableNewsCellHeight: CGFloat = 320
        static let tableDoctorCellHeight: CGFloat = 290
        
        static let newsCellWidth: CGFloat = 274
        static let clvDoctorCellWidth: CGFloat = 137
        static let bottomPadding: CGFloat = 28
    }
    struct Icon {
        static let doctorIcon = UIImage(named: "imageDoctor")
    }
}
protocol HomeTableViewCellProtocol {
    func didTapSeeAll(choose: ChooseScreen)
}

enum ChooseScreen{
    case newsScreen
    case promotionScreen
    case doctorScreen
}
