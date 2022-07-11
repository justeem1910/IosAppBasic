//
//  NewsTableViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 24/06/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnSeeAll: UIButton!
    
    
    var articleList     : [ArticleHomeModel]?
    var promotionList     : [PromotionHomeModel]?
    var getUrlWhenTapCell:((Int) -> ())? = nil
    var pushVCHandler: ((UIViewController) -> ())? = nil
    var delegate: HomeTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        
        collectionView.registerCells(NewsCollectionViewCell.self)
    }
    func configViewsArticle(articleList: [ArticleHomeModel]? ,pushVCHandler: ((UIViewController) -> ())?, getUrlWhenTapCell:((Int) -> ())?) {
        self.getUrlWhenTapCell = getUrlWhenTapCell
        self.pushVCHandler = pushVCHandler
        lblTitle.text = "Tin Tức"
        self.articleList = articleList
        self.promotionList = nil
        collectionView.reloadData()
    }
    
    func configViewsPromotion(promotionList: [PromotionHomeModel]?,pushVCHandler: ((UIViewController) -> ())?, getUrlWhenTapCell:((Int) -> ())?) {
        self.getUrlWhenTapCell = getUrlWhenTapCell
        self.pushVCHandler = pushVCHandler
        lblTitle.text = "Khuyến mại"
        self.articleList = nil
        self.promotionList = promotionList
        collectionView.reloadData()
    }

    @IBAction func pressSeeAll(_ sender: Any) {
        if let articleList = articleList {
            delegate?.didTapSeeAll(choose: ChooseScreen.newsScreen)
        } else {
            delegate?.didTapSeeAll(choose: ChooseScreen.promotionScreen)
        }
    }
    
}
extension NewsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.HomeVC.newsCellWidth, height: collectionView.bounds.height - Constants.HomeVC.bottomPadding)
    }
}

extension NewsTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let articleList = articleList{
            return articleList.count
        }
        return promotionList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(NewsCollectionViewCell.self, indexPath: indexPath)
        if let articleList = articleList {
            let news = articleList[indexPath.item]
            cell.configViews(news: news)
            return cell
        }
        let promotion = promotionList?[indexPath.item]
        cell.configViews(promotion: promotion)
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.getUrlWhenTapCell!(indexPath.item)
    }
}
