//
//  AppDelegate.swift
//  AuthVK
//
//  Created by Фарид Гулиев on 26.03.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit
import SwiftyVK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appID: String = "7376348"
    let scopes: Scopes = [.offline, .friends]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SwitcherVC.updateRootVC()
        setUpVK()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let app = options[.sourceApplication] as? String
        VK.handle(url: url, sourceApplication: app)
        return true
    }
}


//MARK: - SwiftyVKDelegate
extension AppDelegate: SwiftyVKDelegate {
    
    func setUpVK() {
        VK.setUp(appId: self.appID, delegate: self)
    }
    
    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return self.scopes
    }
    
    func vkNeedToPresent(viewController: VKViewController) {
        guard let rootVC = window?.rootViewController else { return }
        rootVC.present(viewController, animated: true)
    }
}

