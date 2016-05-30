//
//  TapglueSims.swift
//  simsTest
//
//  Created by John Nilsen on 5/17/16.
//  Copyright © 2016 John Nilsen. All rights reserved.
//

import UIKit
import Tapglue

public class TapglueSims : NSObject, TGSessionTokenNotifier {
    let appToken: String
    var sessionToken: String?
    var deviceToken: String?
    var api : SimsApi
    
    public init(appToken: String, url: String) {
        self.appToken = appToken
        api = DefaultSimsApi(url: url)
    }
    
    public func registerSimsNotificationSettings(application: UIApplication) {
        let notificationSettings = UIUserNotificationSettings(
            forTypes: [.Badge, .Sound, .Alert], categories: nil)
        application.registerUserNotificationSettings(notificationSettings)

    }
    
    public func registerDeviceToken(deviceToken: NSData) {
        let tokenChars = UnsafePointer<CChar>(deviceToken.bytes)
        var tokenString = ""
        
        for i in 0..<deviceToken.length {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        
        print("Device Token:", tokenString)
        self.deviceToken = tokenString
        registerSims()
    }
    
    @objc public func sessionTokenSet(token: String!) {
        print("sessionTokenSet: \(token)")
        self.sessionToken = token
        registerSims()
    }
    
    private func registerSims() {
        if let deviceToken = deviceToken {
            if let sessionToken = sessionToken {
                registerDeviceOnApiWithAppToken(appToken, deviceToken: deviceToken, sessionToken: sessionToken)
            }
        }
    }
    
    private func registerDeviceOnApiWithAppToken(appToken: String, deviceToken: String, sessionToken: String) {
        api.registerDevice(appToken, deviceToken: deviceToken, sessionToken: sessionToken)
    }
}