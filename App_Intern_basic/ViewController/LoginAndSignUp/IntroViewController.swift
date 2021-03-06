//
//  ViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 06/06/2022.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var clvIntro:UICollectionView!
    @IBOutlet weak var pctrIntro:UIPageControl!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewBgIntro: UIView!
    
    var listImageIntro:[String] = ["bgcell1","bgcell2","bgcell3"]
    let gradient = CAGradientLayer()
    var startColor:CGColor = Constants.Color.gradientIntroStart.cgColor
    var endColor:CGColor = Constants.Color.gradientIntroEnd.cgColor
    
    override func viewDidLayoutSubviews() {
        gradient.frame = viewBgIntro.bounds
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
    }
    func setView(){
        clvIntro.delegate = self
        clvIntro.dataSource = self
        
        gradient.colors = [startColor as Any, endColor as Any]
        gradient.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        viewBgIntro.layer.insertSublayer(gradient, at: 0)
        
        btnLogin.layer.cornerRadius = 24
        btnRegister.layer.borderWidth = 1

        btnRegister.layer.borderColor = Constants.Color.purple1.cgColor
        btnRegister.layer.cornerRadius = 24
        
        clvIntro.registerCells(IntroCell.self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.clvIntro.contentOffset, size: self.clvIntro.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

        if let visibleIndexPath = self.clvIntro.indexPathForItem(at: visiblePoint) {
            self.pctrIntro.currentPage = visibleIndexPath.row
            
        }
    }
    
    
    @IBAction func btnLoginIntro(_ sender: Any) {
        let phoneVc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhoneViewController") as? PhoneViewController
        self.navigationController?.pushViewController(phoneVc!, animated: true)
    }
    
    @IBAction func btnRegisterIntro(_ sender: Any) {
        let phoneVc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PhoneViewController") as? PhoneViewController
        self.navigationController?.pushViewController(phoneVc!, animated: true)
    }
    
}
extension IntroViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: IntroCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCell", for: indexPath) as! IntroCell

        cell.configViews(image: listImageIntro[indexPath.row])

        return cell
    }
}
extension IntroViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImageIntro.count
    }
    
    
}
extension IntroViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


