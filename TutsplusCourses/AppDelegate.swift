//
//  AppDelegate.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 16/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit
import Intents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        requestAuthorization()
        return true
    }
    
    private func requestAuthorization() {
        INPreferences.requestSiriAuthorization { (status) in
            if status == .authorized {
                print("Authorization to Siri was granted")
            } else {
                print("Authorization to Siri was denied")
            }
        }
    }

}

