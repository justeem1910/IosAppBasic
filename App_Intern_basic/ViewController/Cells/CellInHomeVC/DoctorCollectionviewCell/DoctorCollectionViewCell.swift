//
//  DoctorCollectionViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 25/06/2022.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var lblStar: UILabel!
    @IBOutlet weak var viewBackGround:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBackGround.layer.cornerRadius = 8
        viewBackGround.layer.borderColor = Constants.Color.gray5.cgColor
        viewBackGround.layer.borderWidth = 1
        
        img.layer.cornerRadius = 6
    }
    func configViews(doctorInfo: DoctorHomeModel?) {
        let imageURL = doctorInfo?.avatar
        let name = doctorInfo?.full_name
        let major = doctorInfo?.majors_name
        let star = doctorInfo?.ratio_star
        let numberOfReviews = doctorInfo?.number_of_reviews
        
        configViews(imageURLStr: imageURL, name: name, major: major, star: star, numberOfReviews: numberOfReviews)
    }
    private func configViews(imageURLStr: String?, name: String?, major: String?, star: Double?, numberOfReviews: Int?) {
        Ultilities.loadImage(img, strURL: imageURLStr ?? "", placeHolder: Constants.Icon.doctorIcon)
        lblName.text = name ?? " "
        lblSpecial.text = major ?? " "
        
        let font = UIFont(name: Constants.Font.nunitoRegular, size: 11)
        let headColor = Constants.Color.gray1
        let tailColor = Constants.Color.gray3
        
        let attributedRateScore = NSMutableAttributedString()
            .attrStr(text: String(format: "%.1f", star ?? 0), font: font, textColor: headColor)
            .attrStr(text: " (\(numberOfReviews ?? 0))", font: font, textColor: tailColor)
        lblStar.attributedText = attributedRateScore
    }
    
}
