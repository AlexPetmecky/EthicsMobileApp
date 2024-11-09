//
//  AboutDetailViewController.swift
//  MobileAppEthics
//
//  Created by Jacqueline Viera-Gomez on 11/7/24.
//


import UIKit

class AboutDetailViewController: UIViewController {
    
    private var sectionTitle: String
    private var descriptionText: String
    
    init(title: String, description: String) {
        self.sectionTitle = title
        self.descriptionText = description
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Color
        view.backgroundColor =  UIColor(named: "Color1")
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = sectionTitle
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        //
        
        // Description Label
        let descriptionLabel = UILabel()
        descriptionLabel.text = descriptionText
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.backgroundColor = UIColor(named: "Color1")
        descriptionLabel.textColor = .black
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        //translateAutoresizingMaskIntoContraints-
        
        
        // Go Back Button
        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        goBackButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goBackButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            
            goBackButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // Action for Go Back Button
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
