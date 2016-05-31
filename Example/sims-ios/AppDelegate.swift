//
//  AppDelegate.swift
//  sims-ios
//
//  Created by John Nilsen on 05/23/2016.
//  Copyright (c) 2016 John Nilsen. All rights reserved.
//

import UIKit
import Tapglue
import TapglueSims

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appToken = "2da2d79336c2773c630ce46f5d24cb76"
    let url = "https://api.tapglue.com"
    var sims: TapglueSims!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        sims = TapglueSims(appToken: appToken, url: url)
        registerForPushNotifications(application)
        let customConfig = TGConfiguration.defaultConfiguration()
        customConfig.loggingEnabled = true
        Tapglue.setUpWithAppToken(appToken, andConfig: customConfig)
        
        Tapglue.setSessionTokenNotifier(sims)
        
        print(launchOptions)
        return true
    }
    
    func registerForPushNotifications(application: UIApplication) {
        sims.registerSimsNotificationSettings(application)
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .None {
            application.registerForRemoteNotifications()
        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        sims.registerDeviceToken(deviceToken)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Failed to register:", error)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification notificationSettings: [NSObject : AnyObject]) {
        print(notificationSettings)
    }
}

