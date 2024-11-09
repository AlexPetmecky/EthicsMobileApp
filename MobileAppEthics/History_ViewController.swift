//
//  History_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/19/24.
//

import UIKit

class History_ViewController: UIViewController {

    @IBOutlet weak var questionHist: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonHandler = HandleJson()
        jsonHandler.load_data()
        
        
        var txt = ""
        for i in jsonHandler.questions{
            var temp = "QUESTION: "+i.question + "\n"+"ANSWER: "+i.answer+"\n"+"\n"
            txt+=temp
            
        }
        questionHist.text = txt
        questionHist.isEditable = false
        
        
        //questionHist.text = jsonHandler.questions
        
        
        

        // Do any additional setup after loading the view.
        view.backgroundColor =  UIColor(named: "Color1")

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
