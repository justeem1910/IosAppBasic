//
//  PromotionVCTableViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 29/06/2022.
//

import UIKit

class PromotionVCTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 8
        img.layer.borderColor = Constants.Color.gray5.cgColor
        img.layer.borderWidth = 1
    }

    func configViewsPromotionVc(promotion: PromotionHomeModel?) {
        let imageURL = promotion?.picture
        let title = promotion?.name
        let date = promotion?.created_at
        let dateArr = date?.components(separatedBy: "/")
        let time = "\(dateArr?[0] ?? "" ) tháng \(dateArr?[1] ?? ""), \(dateArr?[2] ?? "")"
        configViews(imageURLStr: imageURL, title: title, date: time)
    }
    
    func configViewsNewsVc(news: ArticleHomeModel?) {
        let imageURL = news?.picture
        let title = news?.title
        let date = news?.created_at
        let dateArr = date?.components(separatedBy: "/")


        let time = "\(dateArr?[0] ?? "" ) tháng \(dateArr?[1] ?? ""), \(dateArr?[2] ?? "")"
        configViews(imageURLStr: imageURL, title: title, date: time)
    }
    
    
    
    private func configViews(imageURLStr: String?, title: String?, date: String?) {
        Ultilities.loadImage(img, strURL: imageURLStr ?? "", placeHolder: UIImage(named: ""))
        lblTitle.text = title ?? " "
        lblTime.text = date ?? " "
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
