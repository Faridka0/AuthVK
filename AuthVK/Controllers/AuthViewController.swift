//
//  AuthViewController.swift
//  AuthVK
//
//  Created by Фарид Гулиев on 26.03.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    //MARK: - Services
    let vkService = VKService()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - IBActions
    @IBAction func authButtonPressed(_ sender: UIButton) {
        vkService.auth { (info, error) in
            guard error == nil else { return }
            guard info != nil else { return }
            UserDefaults.standard.set(true, forKey: "isAuth")
            DispatchQueue.main.async {
                SwitcherVC.updateRootVC()
            }
        }
    }
}
