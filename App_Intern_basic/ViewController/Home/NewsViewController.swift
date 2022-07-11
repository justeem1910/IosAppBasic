//
//  NewsViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 04/07/2022.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var btnBack:UIButton!
    @IBOutlet weak var tbvNews: UITableView!
    var newsList: [ArticleHomeModel]?

    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        return rfc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        tbvNews.delegate = self
        tbvNews.dataSource = self
        tbvNews.register(UINib(nibName: "NewsVCTableViewCell1", bundle: nil), forCellReuseIdentifier: "NewsVCTableViewCell1")
        tbvNews.register(UINib(nibName: "PromotionVCTableViewCell", bundle: nil), forCellReuseIdentifier: "PromotionVCTableViewCell")
        
        tbvNews.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        
        loadNewFeed()
    }
    @objc func loadNewFeed() {
        self.showLoaderView()
        
        APIUtilities.requestNewsVC { [weak self] newsFeed, error in
            guard let self = self else { return}
            self.dismissLoaderView()
            self.refreshControl.endRefreshing()
            
            guard let newsFeed = newsFeed, error == nil else {
                return
            }
            self.newsList = newsFeed.newsList
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.tbvNews.reloadData()
            }
        }
    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension NewsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return (tableView.bounds.width * (200/375)) + Constants.NewsVC.clvNewsCellHeight1
        }
        return Constants.NewsVC.clvNewsCellHeight + Constants.NewsVC.clvNewstionSpace
    }
}

extension NewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsVCTableViewCell1", for: indexPath) as! NewsVCTableViewCell1
            cell.selectionStyle = .none
            let news = newsList?[indexPath.item]
            cell.configViewsNewsVc(news: news)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionVCTableViewCell", for: indexPath) as! PromotionVCTableViewCell
        cell.viewSeperator.isHidden = false
        let news = newsList?[indexPath.item]
        cell.configViewsNewsVc(news: news)
        cell.selectionStyle = .none
        if indexPath.item == (newsList?.count ?? 0) - 1{
            cell.viewSeperator.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        detailsVC?.stringURL = self.newsList?[indexPath.item].link ?? ""
        
        self.navigationController?.pushViewController(detailsVC!, animated: true)
    }
    
}

