//
//  HomeViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 22/06/2022.
//

import UIKit

class HomeViewController: BaseViewController {

    
    @IBOutlet weak var viewBackGroundTableView: UIView!
    @IBOutlet weak var tableViewHome: UITableView!
    
    @IBOutlet weak var imgAvatarUser: UIImageView!
    var newsModel: HomeTabModel?
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewHome.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableViewHome.register(UINib(nibName: "PromotionTableViewCell", bundle: nil), forCellReuseIdentifier: "PromotionTableViewCell")
        tableViewHome.register(UINib(nibName: "DoctorTableViewCell" , bundle: nil), forCellReuseIdentifier: "DoctorTableViewCell")
        
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        tableViewHome.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeInfoUser(tapGestureRecognizer:)))
        
        
        imgAvatarUser.isUserInteractionEnabled = true
        imgAvatarUser.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        
        
        
        loadNewFeed()
    }
    override func viewDidLayoutSubviews() {
        viewBackGroundTableView.clipsToBounds = true
        viewBackGroundTableView.roundCorners(corners: [.topLeft, .topRight], radius: 16)
        
    }
    @objc func changeInfoUser(tapGestureRecognizer: UITapGestureRecognizer) {

        // Your action
    }
    
    @objc func loadNewFeed() {
        self.showLoaderView()
        APIUtilities.requestHomePatientFeed { [weak self] patientNewFeed, error in
            guard let self = self else { return}
            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let patientNewFeed = patientNewFeed, error == nil else {
                return
            }
            

            self.newsModel = patientNewFeed

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.tableViewHome.reloadData()
            }
        }
    }
    // MARK: ACTION BUTTON SEE ALL
    @objc func btnSeeAllInCellAction(sender: UIButton){
        if sender.tag == 0 {
            let newsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController
            self.navigationController?.pushViewController(newsVC!, animated: true)
        }
        if sender.tag == 1 {
            let promotionVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PromotionViewController") as? PromotionViewController
            self.navigationController?.pushViewController(promotionVC!, animated: true)
        }
        if sender.tag == 2 {
            let doctorVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DoctorViewController") as? DoctorViewController
            self.navigationController?.pushViewController(doctorVC!, animated: true)
        }
    }
}

//MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 2 {
            return Constants.HomeVC.tableDoctorCellHeight
        } else {
            return Constants.HomeVC.tableNewsCellHeight
        }
        
    }
}



//MARK: UITableviewDataSource
extension HomeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.btnSeeAll.tag = indexPath.item
            cell.btnSeeAll.addTarget(self, action: #selector(btnSeeAllInCellAction(sender:)), for: .touchUpInside)
            
            cell.configViewsArticle(articleList: newsModel?.articleList) { indexItem in
                
                let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
                
                detailsVC?.stringURL = self.newsModel?.articleList![indexItem].link ?? ""
                self.navigationController?.pushViewController(detailsVC!, animated: true)
                
            }
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.btnSeeAll.tag = indexPath.item
            cell.btnSeeAll.addTarget(self, action: #selector(btnSeeAllInCellAction(sender:)), for: .touchUpInside)
            cell.configViewsPromotion(promotionList: newsModel?.promotionList){ indexItem in
                
                let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
                
                detailsVC?.stringURL = self.newsModel?.promotionList![indexItem].link ?? ""
                self.navigationController?.pushViewController(detailsVC!, animated: true)
                
            }
            return cell
        }
        if indexPath.item == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorTableViewCell", for: indexPath) as! DoctorTableViewCell
            
            cell.btnSeeAll.tag = indexPath.item
            cell.btnSeeAll.addTarget(self, action: #selector(btnSeeAllInCellAction(sender:)), for: .touchUpInside)
            
            cell.configViews(doctorList: newsModel?.doctorList)
            return cell
        }
        fatalError()
    }
    
    
    
}

