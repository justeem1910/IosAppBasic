//
//  DoctorCollectionViewCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 25/06/2022.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var lblVote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
