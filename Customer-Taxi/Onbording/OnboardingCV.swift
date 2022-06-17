//
//  OnboardingVC.swift
//  DR
//
//  Created by Amira Zahran on 01/06/2022.
//

import UIKit


extension UIButton{
    @IBInspectable var cornerRedius:CGFloat{
        get{
            return 0
        }
        set(value){
            self.layer.cornerRadius = value
        }
    }
}

//extension UIViewController {
//    func go_screens(_ story:String = "Main", id:String){
//        let story = UIStoryboard(name: story, bundle: nil)
//        let screen = story.instantiateViewController(identifier: id)
//        navigationController?.pushViewController(screen, animated: true)
//    }
//}

class OnboardingVC: UIViewController {
    
    
    @IBOutlet weak var start_btn: UIButton!
    @IBOutlet weak var pageC: UIPageControl!
    @IBOutlet weak var collectionV: UICollectionView!
    
    var slides: [OnboardingSlid] = []
    var currentPage = 0 {
        didSet{
            pageC.currentPage = currentPage

            if currentPage == slides.count - 1 {
                start_btn.setTitle("Get Started", for: .normal)
            } else {
                start_btn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        slides = [
            OnboardingSlid.init(title: "Tax.io", description: "Order from your favourite stores or vendors", image: "taxi"),
            
            OnboardingSlid(title: "", description: "Choose from a wide range of delicious meals", image: "taxi"),
        
            OnboardingSlid(title: "Tax.io", description: "Enjoy instant delivery and payment", image: "taxi")
            ]

    }
    
    @IBAction func btn(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
             go_screens(id: "homevc")
            
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
        
    
}


extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.identifier, for: indexPath)
            as! OnboardCollectionViewCell
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionV.frame.width, height: collectionV.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
