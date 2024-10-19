//
//  ViewController.swift
//  MobileAppEthics
//
//  Created by Alex Petmecky on 10/18/24.
//

import UIKit

class ViewController: UIViewController {
    //EDITS
    // test miles2
    @IBOutlet weak var loginBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginBTN.addTarget(self, action: #selector(self.login(_:)), for: UIControl.Event.touchUpInside)
        
        
        
    }
    
    @IBAction func login(_ sender: Any){
        
    }


}

