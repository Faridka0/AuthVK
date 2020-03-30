//
//  SwitcherVC.swift
//  AuthVK
//
//  Created by Фарид Гулиев on 27.03.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

class SwitcherVC {
    
    static func updateRootVC() {
        
        let isAuth = UserDefaults.standard.bool(forKey: "isAuth")
        var rootVC : UIViewController?

        
        if isAuth {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        } else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as!  AuthViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
    }
    
}
