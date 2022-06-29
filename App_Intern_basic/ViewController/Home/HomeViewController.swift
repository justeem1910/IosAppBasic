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
        
        tableViewHome.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        
        
        
        
        loadNewFeed()
    }
    override func viewDidLayoutSubviews() {
        viewBackGroundTableView.clipsToBounds = true
        viewBackGroundTableView.roundCorners(corners: [.topLeft, .topRight], radius: 16)
        
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
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 2 {
            return Constants.HomeVC.tableDoctorCellHeight
        } else {
            return Constants.HomeVC.tableNewsCellHeight
        }
        
    }
}
extension HomeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.configViews(articleList: newsModel?.articleList, pushVCHandler: { [weak self] vc in
                guard let self = self else { return }
                
                self.show(vc, sender: nil)
            })
            return cell
        }
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.configViews(promotionList: newsModel?.promotionList, pushVCHandler: {[weak self] vc in
                guard let self = self else {return}
                self.show(vc, sender: nil)
                
            })
            return cell
        }
        if indexPath.item == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorTableViewCell", for: indexPath) as! DoctorTableViewCell
            cell.configViews(doctorList: newsModel?.doctorList, pushVCHandler: {
                
            })
            return cell
        }
        fatalError()
    }
}

