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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressSeeAll(_ sender: Any) {
        
    }
    
}
