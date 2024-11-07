//
//  HandleJson.swift
//  MobileAppEthics
//
//  Created by Alex Petmecky on 10/29/24.
//

import Foundation

struct Qdata: Codable {
    let questionID:Int
    let question:String
    let answer:String
    let sentiment:String
}

struct user: Codable{
    let username:String
    let pwd:String
    let email:String
}

class HandleJson {
    
    var questions: [Qdata] = []
    
    var users:[user] = []
    
    func load_data() {
        // Make sure data.json exists in the documents directory
        copyBundleFileToDocumentsDirectoryIfNeeded(file: "data")
        
        // Load from the documents directory
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("data.json") else {
            print("Failed to create URL for file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.questions = try decoder.decode([Qdata].self, from: data)
            print("Data successfully loaded from \(url.path)")
        } catch {
            print("Failed to load or decode: \(error.localizedDescription)")
        }
    }
    
    func insert_new(question: String,answer:String,sentiment: String) {
        let questionID = questions.count
        let newQ = Qdata(questionID: questionID, question: question,answer: answer ,sentiment: sentiment)
        questions.append(newQ)
        print("Updated questions:", questions)
    }
    
    func saveJSONData(file:String) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(questions)
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(file).json") else {
                print("Failed to create URL for file.")
                return
            }
            
            try jsonData.write(to: url)
            print("Data successfully written to \(url.path)")
            print("Data content: \(String(data: jsonData, encoding: .utf8) ?? "N/A")")
        } catch {
            print("Failed to encode or save data: \(error.localizedDescription)")
        }
    }
    
    func copyBundleFileToDocumentsDirectoryIfNeeded(file:String) {
        let fileManager = FileManager.default
        guard let bundleURL = Bundle.main.url(forResource: file, withExtension: "json"),
              let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(file+".json") else {
            print("File path error.")
            return
        }
        
        if !fileManager.fileExists(atPath: documentsURL.path) {
            do {
                try fileManager.copyItem(at: bundleURL, to: documentsURL)
                print(file+".json copied to documents directory.")
            } catch {
                print("Failed to copy \(file).json: \(error.localizedDescription)")
            }
        }
    }
    
    
    func loadUserData(){
        copyBundleFileToDocumentsDirectoryIfNeeded(file: "userdata")
        
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("userdata.json") else {
            print("Failed to create URL for file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.users = try decoder.decode([user].self, from: data)
            print("Data successfully loaded from \(url.path)")
            print(self.users)
        } catch {
            print("Failed to load or decode: \(error.localizedDescription)")
        }
        
        
    }
    
    func insertNewUser(username:String,pwd:String,email:String){
        //let questionID = questions.count
        let newU = user(username: username, pwd: pwd, email: email)
        users.append(newU)
        print("Updated users:", users)
    }
    
    func saveJSONDataUsers(file:String) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(users)
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(file).json") else {
                print("Failed to create URL for file.")
                return
            }
            
            try jsonData.write(to: url)
            print("Data successfully written to \(url.path)")
            print("Data content: \(String(data: jsonData, encoding: .utf8) ?? "N/A")")
        } catch {
            print("Failed to encode or save data: \(error.localizedDescription)")
        }
    }
    
    func getUserInfo(email:String)->[user]{
        var usersFiltered = users.filter{$0.email == email}
        return usersFiltered
        
    }
    
    func getUserInfoBy_uname(uname:String)->[user]{
        var usersFiltered = users.filter{$0.username == uname}
        return usersFiltered
        
    }
    
    
}



/*
class HandleJson{
    
    var questions:[Qdata] = []
    
    func load_data() {
        self.copyBundleFileToDocumentsDirectoryIfNeeded()
        
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
                print("Failed to locate data.json in bundle.")
                return
            }
            
            // Load the data
            do {
                let data = try Data(contentsOf: url)
                
                // Decode the JSON data
                let decoder = JSONDecoder()
                self.questions = try decoder.decode([Qdata].self, from: data)
                
                
            } catch {
                print("Failed to load or decode: \(error.localizedDescription)")
                return
            }
    }
    
    func insert_new(question:String,sentiment:String){
        let questionID = questions.count
        let newQ = Qdata(questionID: questionID, question: question, sentiment: sentiment)
        questions.append(newQ)
        print(questions)
    }
    
    
    // Method to save the people array back to JSON
    func saveJSONData() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        

        do {
            let jsonData = try encoder.encode(questions)
            guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("data.json") else {
                print("Failed to create URL for file.")
                return
            }

            try jsonData.write(to: url)
            print("Data successfully written to \(url.path)")
            print("Data content: \(String(data: jsonData, encoding: .utf8) ?? "N/A")")
        } catch {
            print("Failed to encode or save data: \(error.localizedDescription)")
        }
    }
    
    func copyBundleFileToDocumentsDirectoryIfNeeded() {
        let fileManager = FileManager.default
        guard let bundleURL = Bundle.main.url(forResource: "data", withExtension: "json"),
              let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("data.json") else {
            print("File path error.")
            return
        }
        
        if !fileManager.fileExists(atPath: documentsURL.path) {
            do {
                try fileManager.copyItem(at: bundleURL, to: documentsURL)
                print("data.json copied to documents directory.")
            } catch {
                print("Failed to copy data.json: \(error.localizedDescription)")
            }
        }
    }
    
    
}
*/
