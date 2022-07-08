//
//  PromotionViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 29/06/2022.
//

import UIKit

class PromotionViewController: BaseViewController {

    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var tbvPromotion: UITableView!
    
    var promotionList     : [PromotionHomeModel]?
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    func setView() {
        tbvPromotion.register(UINib(nibName: "PromotionVCTableViewCell", bundle: nil), forCellReuseIdentifier:  "PromotionVCTableViewCell")
        tbvPromotion.delegate = self
        tbvPromotion.dataSource = self
        
        layoutView(view: viewBG)
        
        tbvPromotion.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        loadNewFeed()
    }
    @objc func loadNewFeed() {
        self.showLoaderView()
        
        APIUtilities.requestPromotionVC { [weak self] promotionFeed, error in
            guard let self = self else { return}
            self.dismissLoaderView()
            self.refreshControl.endRefreshing()
            
            guard let promotionFeed = promotionFeed, error == nil else {
                return
            }
            self.promotionList = promotionFeed.promotionList
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.tbvPromotion.reloadData()
            }
        }
    }
    func layoutView(view: UIView){
        view.layer.shadowColor = Constants.Color.shadowColor.cgColor
        view.layer.shadowRadius = 30
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    

    @IBAction func PressBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension PromotionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return Constants.PromotionVC.clvPromotionCellHeight + Constants.PromotionVC.clvPromotionSpace
    }
}


extension PromotionViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotionList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionVCTableViewCell", for: indexPath) as! PromotionVCTableViewCell
        let promotion = promotionList?[indexPath.item]
        cell.configViewsPromotionVc(promotion: promotion)
        
        if indexPath.item == (promotionList?.count ?? 0) - 1{
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.view.bounds.width)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        detailsVC?.stringURL = self.promotionList?[indexPath.item].link ?? ""
        
        self.navigationController?.pushViewController(detailsVC!, animated: true)
    }
    
    
}
