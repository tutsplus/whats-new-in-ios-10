//
//  AppDelegate.swift
//  TutsplusCourses
//
//  Created by Markus Mühlberger on 16/12/2016.
//  Copyright © 2016 Markus Mühlberger. All rights reserved.
//

import UIKit
import Intents
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        requestAuthorization()
        configureNotifications()
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
    
    private func configureNotifications() {
        UNUserNotificationCenter.current().delegate = self
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
//            if let error = error {
//                print(error)
//            }
//        }

        // TODO
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }

}

