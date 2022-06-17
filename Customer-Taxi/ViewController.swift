//
//  ViewController.swift
//  taxi
//
//  Created by Amira Zahran on 19/04/2022.
//

import UIKit
import Lottie

extension UIViewController{
    func go_screens(_ story:String = "Main", id:String){
        let story = UIStoryboard(name: story, bundle: nil)
        let screen = story.instantiateViewController(identifier: id)
        navigationController?.pushViewController(screen, animated: true)
    }
    func finish(){
        navigationController?.popViewController(animated: false)
    }
}

extension UIButton{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return 0
        }
        set(value){
            self.layer.cornerRadius = value
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                   self.go_screens(id: "get")
                   print("aff")
                   //self.finish()
               }
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(getS))
//        view.addGestureRecognizer(tap)
//        view.isUserInteractionEnabled = true
        
        
               
    }


//    @objc func getS() {
//        self.go_screens(id: "get")
//    }
    
    
    func lottieAnimation(){
        let animationview = AnimationView(name: "man-waiting-car")
        
        animationview.frame = CGRect(x: 0, y: 0, width: 500, height: 700)
        animationview.center = self.view.center
        animationview.contentMode = .scaleAspectFit
        view.addSubview(animationview)
        animationview.loopMode = .loop
        animationview.play()
        
        
     
    }
}


