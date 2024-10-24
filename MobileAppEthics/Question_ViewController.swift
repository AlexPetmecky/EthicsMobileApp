//
//  Question_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/19/24.
//

import UIKit
import GoogleGenerativeAI

class Question_ViewController: UIViewController {

    @IBOutlet weak var questionField: UITextField!
    
    //key:AIzaSyDZc5xAXGJhifuGwUyUkEzwCQ2CVLRuj94
    var key = "AIzaSyDZc5xAXGJhifuGwUyUkEzwCQ2CVLRuj94"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .orange // for testing

    }
    
    func makeRequest() async{
        let generativeModel =
          GenerativeModel(
            // Specify a Gemini model appropriate for your use case
            name: "gemini-1.5-flash",
            // Access your API key from your on-demand resource .plist file (see "Set up your API key"
            // above)
            apiKey: self.key
          )
        
        let prompt = questionField.text!
        
        let response = try? await generativeModel.generateContent(prompt)
        if let text = response?.text {
          print(text)
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
