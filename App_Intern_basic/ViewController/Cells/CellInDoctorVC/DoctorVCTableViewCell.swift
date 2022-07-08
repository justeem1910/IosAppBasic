//
//  DoctorVCTableViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 04/07/2022.
//

import UIKit

class DoctorVCTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBG:UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var lblStar: UILabel!
    @IBOutlet weak var lblVote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 6
        viewBG.layer.cornerRadius = 12
        viewBG.layer.borderWidth = 1
        viewBG.layer.borderColor = Constants.Color.gray5.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configViewsDoctor(doctorInfo: DoctorHomeModel?) {
        let imageURL = doctorInfo?.avatar
        let name = doctorInfo?.full_name
        let major = doctorInfo?.majors_name
        let star = doctorInfo?.ratio_star
        let numberOfReviews = doctorInfo?.number_of_reviews
        
        configViews(imageURLStr: imageURL, name: name, major: major, star: star, numberOfReviews: numberOfReviews)
    }
    private func configViews(imageURLStr: String?, name: String?, major: String?, star: Double?, numberOfReviews: Int?) {
        Ultilities.loadImage(img, strURL: imageURLStr ?? "", placeHolder: Constants.Icon.doctorIcon)
        lblName.text = "Chuyên ngành: " + (name ?? " ")
        lblSpecial.text = major ?? " "
        
        let font = UIFont(name: Constants.Font.nunitoRegular, size: 12)
        let headColor = Constants.Color.gray1
        let tailColor = Constants.Color.gray3
        
        let attributedRateScore = NSMutableAttributedString()
            .attrStr(text: String(format: "%.1f", star ?? 0), font: font, textColor: headColor)
            .attrStr(text: " (\(numberOfReviews ?? 0))", font: font, textColor: tailColor)
        lblStar.attributedText = attributedRateScore
    }
    
    
}
