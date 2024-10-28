//
//  Resources_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/28/24.
//

import UIKit

class Resources_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func web1(_ sender: UIButton) {
        
        if let url = URL(string: "https://www.edx.org/learn/ethics") {
            UIApplication.shared.open(url, options: [:]) { success in
                if success {
                    print("URL was opened successfully.")
                } else {
                    print("Failed to open URL.")
                }
            }
        }
    }
    
    @IBAction func web2(_ sender: UIButton) {
        
        if let url = URL(string: "https://www.pearson.com/en-us/subject-catalog/p/ethics-for-the-information-age/P200000003489/9780135217979") {
            UIApplication.shared.open(url, options: [:]) { success in
                if success {
                    print("URL was opened successfully.")
                } else {
                    print("Failed to open URL.")
                }
            }
        }
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
