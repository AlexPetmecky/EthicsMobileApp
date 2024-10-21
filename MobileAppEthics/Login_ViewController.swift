//
//  ViewController.swift
//  MobileAppEthics
//
//  Created by Alex Petmecky on 10/18/24.
//

import UIKit

class Login_ViewController: UIViewController {
    //EDITS
    // test miles2
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var pwd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // commenting this out to avoid errors from simulation:
        // loginBTN.addTarget(self, action: #selector(self.login(_:)), for: UIControl.Event.touchUpInside)
    
        view.backgroundColor = .lightGray // for testing

        
    }
    
    @IBAction func login(_ sender: Any){
        print(username.text!)
        print(pwd.text!)
        
        if(username.text! == "test" && pwd.text! == "test"){
            print("HERE!")
            //Home_ViewController()
            //self.navigationController?.setViewControllers(Home_ViewController(), animated: false, completion: nil)
            
            let vc = Home_ViewController()
            self.show(vc, sender: self)
        }else{
            print("ON ELSE")
        }
                
    }


}

