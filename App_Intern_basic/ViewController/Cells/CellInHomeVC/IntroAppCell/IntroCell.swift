//
//  IntroCell.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 06/06/2022.
//

import UIKit

class IntroCell: UICollectionViewCell {
    
    @IBOutlet weak var img_intro:UIImageView!
    
    
    func configViews(image: String) {
        img_intro.image = UIImage.init(named: image)
    }
}
