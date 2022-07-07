//
//  DoctorTableViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 24/06/2022.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var btnSeeAll:UIButton!
    
    var pushVCHandler: (() -> ())? = nil
    var doctorList     : [DoctorHomeModel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        
        collectionView.register(UINib(nibName: "DoctorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DoctorCollectionViewCell")
    }
    
    func configViews(doctorList: [DoctorHomeModel]?, pushVCHandler: (() -> ())?) {
        
        self.doctorList = doctorList
        self.pushVCHandler = pushVCHandler
        collectionView.reloadData()
    }
    
}

// MARK: DoctorCollectionviewDelegateFlowLayout

extension DoctorTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.HomeVC.clvDoctorCellWidth, height: collectionView.bounds.height - Constants.HomeVC.bottomPadding )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

// MARK: DoctorCollectionviewDataSource
extension DoctorTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctorList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorCollectionViewCell", for: indexPath) as! DoctorCollectionViewCell
        let doctor = doctorList?[indexPath.item]
        cell.configViews(doctorInfo: doctor)
        return cell
    }
    
    
}
