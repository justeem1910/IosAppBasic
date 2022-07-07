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
        
        viewBackGroundTableView.roundCorners(corners: [.topLeft, .topRight], radius: 16)
        
        tableViewHome.registerCells(NewsTableViewCell.self, DoctorTableViewCell.self)
        
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        tableViewHome.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeInfoUser(tapGestureRecognizer:)))
        
        
        imgAvatarUser.isUserInteractionEnabled = true
        imgAvatarUser.addGestureRecognizer(tapGestureRecognizer)
        
        loadNewFeed()
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
            let cell = tableView.dequeueReusableCell(NewsTableViewCell.self, indexPath: indexPath)
            cell.btnSeeAll.tag = indexPath.item
            cell.configViewsArticle(articleList: newsModel?.articleList, pushVCHandler: {[weak self] vc in
                    guard let self = self else { return }

                    self.show(vc, sender: nil)

            }) { indexItem in
                
                let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController

                detailsVC?.stringURL = self.newsModel?.articleList![indexItem].link ?? ""
                self.navigationController?.pushViewController(detailsVC!, animated: true)

            }
            cell.delegate = self
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(NewsTableViewCell.self, indexPath: indexPath)
            cell.btnSeeAll.tag = indexPath.item
            cell.configViewsPromotion(promotionList: newsModel?.promotionList, pushVCHandler: { [weak self] vc in
                    guard let self = self else { return }
                    
                    self.show(vc, sender: nil)
                }
            ) { indexItem in
                
                let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
                
                detailsVC?.stringURL = self.newsModel?.promotionList![indexItem].link ?? ""
                self.navigationController?.pushViewController(detailsVC!, animated: true)
                
            }
            cell.delegate = self
            return cell
        }
        if indexPath.item == 2 {
            let cell = tableView.dequeueReusableCell(DoctorTableViewCell.self, indexPath: indexPath)
            
            cell.btnSeeAll.tag = indexPath.item
            cell.configViews(doctorList: newsModel?.doctorList) {
                
            }
            cell.delegate = self
            return cell
        }
        fatalError()
    }
}
//MARK: HomeTableViewCellProtocol
extension HomeViewController: HomeTableViewCellProtocol {
    func didTapSeeAll(choose: ChooseScreen) {
        switch choose {
        case .newsScreen:
            let newsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController

            self.navigationController?.pushViewController(newsVC!, animated: true)
        case .promotionScreen:
            let promotionVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PromotionViewController") as? PromotionViewController
            self.navigationController?.pushViewController(promotionVC!, animated: true)
        case.doctorScreen:
            let doctorVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DoctorViewController") as? DoctorViewController
            self.navigationController?.pushViewController(doctorVC!, animated: true)
        }
    }
}

//if sender.tag == 0 {
    
//}
//if sender.tag == 1 {
   
//}
//if sender.tag == 2 {
    
//}
