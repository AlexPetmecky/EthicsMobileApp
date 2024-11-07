//
//  About_ViewController.swift
//  MobileAppEthics
//
//  Created by Miles Chen on 10/19/24.
//

import UIKit

class About_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Color
        view.backgroundColor = .white
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "About US"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Buttons
        let teamButton = createButton(withTitle: "About our team", action: #selector(showTeam))
        let purposeButton = createButton(withTitle: "Our Purpose", action: #selector(showPurpose))
        let philosophyButton = createButton(withTitle: "Our Philosophy", action: #selector(showPhilosophy))
        
        // Stack View
        let stackView = UIStackView(arrangedSubviews: [teamButton, purposeButton, philosophyButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func createButton(withTitle title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return button
    }
    
    // Button Actions
    @objc private func showTeam() {
        let detailVC = AboutDetailViewController(title: "About our team", description: "We are a group of students developing a mobile app that provides users access to AI technology.")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc private func showPurpose() {
        let detailVC = AboutDetailViewController(title: "Our Purpose", description: "We aim to bridge the gap between AI technology and our users. Allowing instant access to an AI tool for anyone in need of it.")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc private func showPhilosophy() {
        let detailVC = AboutDetailViewController(title: "Our Philosophy", description: "We are committed to creating a user-friendly platform. We prioritize transparency and reliability.")
        navigationController?.pushViewController(detailVC, animated: true)
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
