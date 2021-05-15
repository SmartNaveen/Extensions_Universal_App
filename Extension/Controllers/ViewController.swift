//
//  ViewController.swift
//  Extension
//
//  Created by Mr. Naveen Kumar on 11/03/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(105, 60, 114)
      //  userNameTextFiled.enablePasswordToggle()
       
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if NetworkReachability.shared.isNetworkAvailable  {
            print("Net is avilable")
        }else {
            print("no internet")
        }
    }
}



extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
   @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
