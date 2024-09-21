//
//  UserProfile.swift
//  TestApp_3
//
//  Created by Max on 21.09.2024.
//

import UIKit

class UserProfile: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backImage"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 25),
            button.widthAnchor.constraint(equalToConstant: 25)
        ])
        return button
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
   @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
       navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
   
    
}


