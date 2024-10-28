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
    }
    
    let apiKey = "AIzaSyDZc5xAXGJhifuGwUyUkEzwCQ2CVLRuj94"
    var prompt = ""
    
    @IBOutlet weak var questionField: UITextField!
    
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        // get text from input field
                
        // guard: ensure input is valid (print error message if blank)
        guard let inputText = questionField.text, !inputText.isEmpty else {
            presentResultViewController(with: "Please enter a prompt.", "No question entered.")
            return
        }
        
        prompt = inputText + " (Responses should be no more than 70-100 words in length)"
        
        // Call async function to generate text
        Task {
            let generatedText = await makeRequest(prompt: prompt)
            
            presentResultViewController(with: generatedText, inputText) // display to results page
        }
    }
    
    // Buttons for FAQs
    @IBAction func faq1(_ sender: UIButton) {
        let inputText = "Is it ethical for students to use ChatGPT on assignments?"
        prompt = inputText + " (Responses should be no more than 70-100 words in length)"
        
        Task {
            let generatedText = await makeRequest(prompt: prompt)
            presentResultViewController(with: generatedText, inputText)
        }
    }
    @IBAction func faq2(_ sender: UIButton) {
        let inputText = "Should social media companies monitor and remove content?"
        prompt = inputText + " (Responses should be no more than 70-100 words in length)"
        
        Task {
            let generatedText = await makeRequest(prompt: prompt)
            presentResultViewController(with: generatedText, inputText)
        }
    }
    @IBAction func faq3(_ sender: UIButton) {
        let inputText = "Is it ethical to build technology that increases global inequality?"
        prompt = inputText + " (Responses should be no more than 70-100 words in length)"
        
        Task {
            let generatedText = await makeRequest(prompt: prompt)
            presentResultViewController(with: generatedText, inputText)
        }
    }
    
    // Display to Result_ViewController
    private func presentResultViewController(with output: String, _ restateQuestion: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // create instance of the Main storyboard
        if let resultVC = storyboard.instantiateViewController(withIdentifier: "Result_ID") as? Result_ViewController {
            resultVC.output = output
            resultVC.question = restateQuestion
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    public func makeRequest(prompt: String) async -> String {
        let generativeModel =
          GenerativeModel(
            // Specify a Gemini model appropriate for your use case
            name: "gemini-1.5-flash",
            // Access API Key
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
