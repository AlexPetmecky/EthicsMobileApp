//
//  Question_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/19/24.
//
//  Reference: https://medium.com/@mortaltechnical/integrating-gemini-api-into-ios-application-using-swift-845d57a4b603

import UIKit
import GoogleGenerativeAI
import Foundation

class Question_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .orange // for testing
    }
    
    //key:AIzaSyDZc5xAXGJhifuGwUyUkEzwCQ2CVLRuj94
    let apiKey = "AIzaSyDZc5xAXGJhifuGwUyUkEzwCQ2CVLRuj94"
    var prompt = ""
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var outputText: UITextView!
    
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        // get text from input field
        guard let inputText = questionField.text, !inputText.isEmpty else {
            outputText.text = "Please enter a prompt."
            return
        }
        prompt = inputText
        
        // Call async function to generate text
        Task {
            let generatedText = await makeRequest(prompt: prompt)
            
            DispatchQueue.main.async {
                self.outputText.text = generatedText
            }
        }
    }
    
    public func makeRequest(prompt: String) async -> String {
        let generativeModel =
          GenerativeModel(
            // Specify a Gemini model appropriate for your use case
            name: "gemini-1.5-flash",
            // Access your API key from your on-demand resource .plist file (see "Set up your API key"
            // above)
            apiKey: self.apiKey
          )
        
        do {
            let response = try await generativeModel.generateContent(prompt)
            if let text = response.text {
                return text
            } else {
                return "Empty"
            }
        } catch {
            print("Error generating content: \(error)")
            return "Error"
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
