


import UIKit

class sms_code: UIViewController {
    
    @IBAction func get(_ sender: Any) {
        go_screens(id: "onboard")
    }
    
    @IBOutlet weak var txt_co: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //txt_co.delegate = self
        
        //txt_co.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(screenup), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(screendown))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
        
        let btn = UIButton()
        btn.cornerRadius = 19
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        textField.resignFirstResponder()
//
//        if let text = textField.text, !text.isEmpty{
//            let code = text
//            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
//                guard success else{ return }
//                DispatchQueue.main.async {
//                    let vc = Map()
//                    //vc.modalPresentationStyle = .fullScreen
//                    self?.present(vc, animated: true)
//                }
//            }
//        }
//
//        return true
//    }
//
    
    
    
    @objc func screendown(){
//        txt_co.resignFirstResponder()
        self.view.frame.origin.y = 0
        
    }
    
    @objc func screenup(){
        self.view.frame.origin.y = -150
    }

        

        
//        let logged_in  =  UserDefaults.standard.bool(forKey: "logged_in")
//            if logged_in{
//                self.go_screen("home")
//            }else{
//                self.go_screen("sign_in")
//            }
        
        
//
//    func getUsers(){
//
//
//    let params = ["method":"login","email":txt_user.text!,"pass":txt_pass.text!,"type":"user"]
//
//    AF.request(API_Helper.api,method: .post,parameters: params,encoding: URLEncoding.httpBody).responseJSON { (e) in
//                if let res = e.value {
//                    if let d = res as? NSDictionary{
//                        //self.lbl_name.text = d["name"] as? String
//                        //self.load.stopAnimating()
//                       // self.saveUserData(d["name"] as! String,d["pic"] as! String)
//                        self.go_screen("homev")
//                    }
//                }
////    }.responseString { (e) in
////        if let res = e.value{
////            if(res.contains("false")){
////               // self.load.stopAnimating()
////                //self.lbl_name.text = "incorrect"
////            }
////        }
//    }
//}
//
//func saveUserData(_ name:String,_ pic:String){
//    UserDefaults.standard.setValue(true, forKey: "logged_in")
//    UserDefaults.standard.setValue(name, forKey: "user_name")
//    //UserDefaults.standard.setValue(pic, forKey: "user_pic")
//    UserDefaults.standard.synchronize()
//}

        
}


