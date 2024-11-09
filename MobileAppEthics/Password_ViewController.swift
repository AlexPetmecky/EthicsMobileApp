//
//  Password_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/19/24.
//

import UIKit

class Password_ViewController: UIViewController {

    
    @IBOutlet weak var pwdRecoveryLabel: UILabel!
    @IBOutlet weak var usernameEntry: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor =  UIColor(named: "Color1")

    }
    
    @IBAction func recoverPwdBtn(_ sender: Any) {
        let userHandler = HandleJson()
        userHandler.loadUserData()
        let userData = userHandler.getUserInfoBy_uname(uname: usernameEntry.text!)
        pwdRecoveryLabel.textColor = UIColor.black
        print(userData[0].pwd)
        pwdRecoveryLabel.text = userData[0].pwd
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
