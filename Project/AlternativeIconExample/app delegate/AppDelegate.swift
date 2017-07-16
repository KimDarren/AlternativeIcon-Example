//
//  AppDelegate.swift
//  AlternativeIconExample
//
//  Created by KimTae jun on 2017. 7. 16..
//  Copyright © 2017년 TAEJUN KIM. All rights reserved.
//

import UIKit
import Then
import AddWith
import SnapKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  // MARK: Application lifecycle
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let iconController = IconViewController()
    let navigationController = UINavigationController(rootViewController: iconController)
    let screenBounds = UIScreen.main.bounds
    let window = UIWindow(frame: screenBounds)
    window.rootViewController = navigationController
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    
    self.window = window
    
    return true
  }
  
}
