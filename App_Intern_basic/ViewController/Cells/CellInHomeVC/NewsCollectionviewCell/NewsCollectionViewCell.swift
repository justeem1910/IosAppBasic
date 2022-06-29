//
//  NewsCollectionViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 25/06/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var imgBackground: UIImageView!
    
    override func awakeFromNib() {
        viewBackGround.layer.cornerRadius = 8
        imgBackground.layer.cornerRadius = 8
        imgBackground.layer.shadowRadius = 20
        imgBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        imgBackground.layer.shadowOpacity = 1
        imgBackground.layer.shadowColor = Constants.Color.shadowColor.cgColor
    }

    
    func configViews(news: ArticleHomeModel?) {
        let imageURL = news?.picture
        let title = news?.title
        let special = news?.category_name
        let date = news?.created_at
        
        configViews(imageURLStr: imageURL, title: title, special: special, date: date)
    }
    
    func configViews(promotion: PromotionHomeModel?) {
        let imageURL = promotion?.picture
        let title = promotion?.name
        let special = promotion?.category_name
        let date = promotion?.created_at

        configViews(imageURLStr: imageURL, title: title, special: special, date: date)
    }

    private func configViews(imageURLStr: String?, title: String?, special: String?, date: String?) {
        Ultilities.loadImage(img, strURL: imageURLStr ?? "", placeHolder: UIImage(named: ""))
        lblTitle.text = title ?? " "
        lblSpecial.text = special ?? " "
        lblDate.text = date ?? " "
    }

}
