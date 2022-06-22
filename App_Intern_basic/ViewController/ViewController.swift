//
//  ViewController.swift
//  App_Intern_basic
//
//  Created by Hoang Long on 06/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clvIntro:UICollectionView!
    @IBOutlet weak var pctrIntro:UIPageControl!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewBgIntro: UIView!
    
    var listImageIntro:[String] = [String]()
    let gradient = CAGradientLayer()
    var startColor:CGColor = CGColor(gray: 1, alpha: 1)
    var endColor:CGColor = CGColor(gray: 1, alpha: 1)
    
    override func viewDidLayoutSubviews() {
        gradient.frame = viewBgIntro.bounds
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    
        
        clvIntro.delegate = self
        clvIntro.dataSource = self
        
        startColor = Constants.Color.gradientIntroStart.cgColor
        endColor = Constants.Color.gradientIntroEnd.cgColor
        
        gradient.colors = [startColor as Any, endColor as Any]
        gradient.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        viewBgIntro.layer.insertSublayer(gradient, at: 0)
        
        btnLogin.layer.cornerRadius = 24
        btnRegister.layer.borderWidth = 1

        btnRegister.layer.borderColor = Constants.Color.purple1.cgColor
        btnRegister.layer.cornerRadius = 24
        
        listImageIntro.append("bgcell1")
        listImageIntro.append("bgcell2")
        listImageIntro.append("bgcell3")
        
               
        clvIntro.register(UINib(nibName: "IntroCell", bundle: nil), forCellWithReuseIdentifier: "IntroCell")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.clvIntro.contentOffset, size: self.clvIntro.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        print("aaaaa  ")
        
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
extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: IntroCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCell", for: indexPath) as! IntroCell

        cell.configViews(image: listImageIntro[indexPath.row])

        return cell
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImageIntro.count
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


