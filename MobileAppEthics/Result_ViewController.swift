//
//  Result_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/19/24.
//

import UIKit

class Result_ViewController: UIViewController {
    
    @IBOutlet weak var outputText: UITextView!

    var output: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        outputText.text = output
    }
    
    @IBOutlet weak var choice: UITextView!
    
    @IBAction func ForButton(_ sender: UIButton) {
        choice.text = "You agree on this issue! Maybe you can convince other people you're right too!"
    }
    
    @IBAction func NeutralButton(_ sender: UIButton) {
        choice.text = "You are neutral on this issue! Is it time to learn more and make up your mind?"
    }
    
    @IBAction func AgainstButton(_ sender: UIButton) {
        choice.text = "You are against this issue! Maybe you can convince other people you're right too!"
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
