//
//  DoctorViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 04/07/2022.
//

import UIKit

class DoctorViewController: BaseViewController {

    @IBOutlet weak var tbvDoctor: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    var doctorList     : [DoctorHomeModel]?
    
    lazy var refreshControl: UIRefreshControl = {
        let rfc = UIRefreshControl()
        
        return rfc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    func setView(){
        tbvDoctor.delegate = self
        tbvDoctor.dataSource = self
        tbvDoctor.register(UINib(nibName: "DoctorVCTableViewCell", bundle: nil), forCellReuseIdentifier: "DoctorVCTableViewCell")
        tbvDoctor.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(loadNewFeed), for: .valueChanged)
        loadNewFeed()
    
    }
    
    @objc func loadNewFeed() {
        self.showLoaderView()
        APIUtilities.requestDoctorVC { [weak self] doctorFeed, error in
            guard let self = self else { return}
            self.dismissLoaderView()
            self.refreshControl.endRefreshing()

            guard let doctorFeed = doctorFeed, error == nil else {
                return
            }
            
            self.doctorList = doctorFeed.doctorList

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return}

                self.tbvDoctor.reloadData()
            }
        }
        
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DoctorViewController:UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension DoctorViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return doctorList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorVCTableViewCell", for: indexPath) as! DoctorVCTableViewCell
        let doctor = doctorList?[indexPath.section]
        
        cell.configViewsDoctor(doctorInfo: doctor)
        return cell
    }
    
    
}
