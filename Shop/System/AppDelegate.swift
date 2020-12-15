//
//  AppDelegate.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = RYJTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

}

