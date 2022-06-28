//
//  NewsTableViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 24/06/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var btnSeeAll: UIButton!
    
    
    var articleList     : [ArticleHomeModel]?
    var promotionList     : [PromotionHomeModel]?
    var pushVCHandler: ((UIViewController) -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }
    func configViews(articleList: [ArticleHomeModel]?, pushVCHandler: ((UIViewController) -> ())?) {
        self.pushVCHandler = pushVCHandler
        
        self.articleList = articleList
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressSeeAll(_ sender: Any) {
    }
    
}
extension NewsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.HomeVC.newsCellWidth, height: collectionView.bounds.height - Constants.HomeVC.bottomPadding)
    }

}
extension NewsTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        
        let news = articleList?[indexPath.item]
        
        cell.configViews(news: news)
        
        return cell
    }
    
    
    
}
