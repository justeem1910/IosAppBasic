//
//  NewsVCTableViewCell1.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 04/07/2022.
//

import UIKit

class NewsVCTableViewCell1: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
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
